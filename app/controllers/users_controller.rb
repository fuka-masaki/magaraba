class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:logout,:top_favorite]}
  before_action :forbid_login_user,{only: [:login,:login_date,:shinki,:create_user]}
  def inquiry

  end

  def login

  end

  def login_date
    @user = User.find_by(password: params[:password],name: params[:name])
    if @user
      session[:user_id] = @user.id  
      flash[:notice] = "ログインしました"
      redirect_to("/home/top")
    else
      @error_message = "パスワードまたはメールアドレスが違います"                    
      @name = params[:name]
      @password = params[:password]
      render("users/login")
    end
  end

  def shinki
    
  end

  def create_user
    @user = User.new(name: params[:name] , password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    flash[:notice] = "ユーザー登録が完了しました"
    redirect_to("/home/top")
  else
    render("users/shinki")
  end

  end

  def logout    #追加
    session[:user_id]  = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/home/top")
  
  end

  def top_favorite
    @user =  User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end
end