class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:logout]}
  before_action :authenticate_user_top_favorite, {only: [:top_favorite]}
  before_action :forbid_login_user,{only: [:login,:login_date,:shinki,:create_user]}
  def inquiry
  end

  def login
  end

  def login_date
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id  
      flash[:notice] = "ログインしました"
      redirect_to("/home/top")
    else
      @error_message = "ユーザー名またはパスワードが違います"                    
      @name = params[:name]
      @password = params[:password]
      render("users/login")
    end
  end
  
  def shinki
    
  end

  def create_user
    if User.find_by(name: params[:name])
      flash[:notice] = "そのユーザー名は既に使われています"
      redirect_to("/users/shinki")
    elsif params[:password1]!=params[:password2]
      flash[:notice] = "パスワードが不適です"
      redirect_to("/users/shinki")
    else
      @user = User.new(name: params[:name] , password: params[:password1],image_name:"kkrn_icon_user_3.png")
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "ユーザー登録が完了しました"
        redirect_to("/home/top")
      else
        render("users/shinki")
      end
    end
  end

  def logout    #追加
    session[:user_id]  = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/home/top")
  
  end

  def authenticate_user_top_favorite
    if @current_user == nil
      redirect_to("/users/top_favorite_login")
    end
  end 

  def top_favorite_login
  end 

  def top_favorite
    like_id = Like.where(user_id: @current_user.id).pluck(:post_id)
    @like_posts = Post.includes(:user).where(id:like_id).page(params[:page]).per(20)
  end

  def change_like
    
    if @current_user.comic1.present?
      @current_user.update_attribute(:comic1, params[:comic1])
    else
      @current_user.comic1=params[:comic1]
      @current_user.save
    end
    if @current_user.comic2.present?
      @current_user.update_attribute(:comic2, params[:comic2])
    else
      @current_user.comic2=params[:comic2]
      @current_user.save
    end
    if @current_user.comic3.present?
       @current_user.update_attribute(:comic3, params[:comic3])
    else
       @current_user.comic3=params[:comic3]
       @current_user.save
    end
    
    
    if @current_user.save
      flash[:notice] = "変更が完了しました"
      redirect_to("/home/top_my_post")
    else
      flash[:notice] = "変更に失敗しました。もう一度お試しください。"
      redirect_to("/home/top_my_post")
    end
  end 

  def change_read
    @user = User.find_by(id: @current_user.id)
    if @user.read.present?
      if @user.update_attribute(:read, params[:read])
        flash[:notice] = "変更が完了しました"
        redirect_to("/home/top_my_post")
      else
        flash[:notice] = "変更に失敗しました。もう一度お試しください。"
        redirect_to("/home/top_my_post")
      end
    else
      @user.read = params[:read]
      if @user.save
        flash[:notice] = "変更が完了しました"
        redirect_to("/home/top_my_post")
      else
        flash[:notice] = "変更に失敗しました。もう一度お試しください。"
        redirect_to("/home/top_my_post")
      end
    end
  end 

  def change_pass
    @user = User.find_by(id: @current_user.id)
    @user.update(password: params[:pass1])
    if params[:pass1]!=params[:pass2]
      flash[:notice] = "パスワードが不適です"
      redirect_to("/home/top_my_post")
    elsif @user.save
      flash[:notice] = "変更が完了しました"
      redirect_to("/home/top_my_post")
    else
      flash[:notice] = "変更に失敗しました。もう一度お試しください。"
      redirect_to("/home/top_my_post")
    end
  end 
  def change_name
    @user = User.find_by(id: @current_user.id)
    @user.update(name: params[:name])
    if @user.save
      flash[:notice] = "変更が完了しました"
      redirect_to("/home/top_my_post")
    else
      flash[:notice] = "変更に失敗しました。もう一度お試しください。"
      redirect_to("/home/top_my_post")
    end
  end 
  
  def change_image
    @user = User.find_by(id: @current_user.id)
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    if @user.save
      flash[:notice] = "画像を変更しました"
      redirect_to("/home/top_my_post")
    else
      flash[:notice] = "変更に失敗しました。もう一度お試しください。"
      redirect_to("/home/top_my_post")
    end
  end
  
  def default
    @user = User.find_by(id: params[:id])
    @user.update(image_name:"kkrn_icon_user_3.png")
    if @user.save
      flash[:notice] = "変更が完了しました"
      redirect_to("/home/top_my_post")
    else
      flash[:notice] = "変更に失敗しました。もう一度お試しください。"
      redirect_to("/home/top_my_post")
    end
  end 
  
  private
  def like_params
    params.permit(:id, :name, :password, :read, :image, :comic1, :comic2, :comic3)
  end
  
end
