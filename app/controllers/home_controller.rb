class HomeController < ApplicationController
  # before_action :ransack,{only: [:top,:top_super_new,:top_my_post,:search]}
  before_action :authenticate_user_top_my_post, {only: [:top_my_post]}
  def top
    #人気漫画
    comic_name = Post.includes(:user).where(parent_id: nil).group(:Manga_name).order('count(Manga_name) desc').pluck(:Manga_name)
    @comics = Comic.where(name: comic_name).order([Arel.sql('field(name, ?)'), comic_name])
    #昨日
    yesterday_like_id = Like.includes(:user).group(:post_id).where("likes.created_at >= ?", Time.now.yesterday).where("likes.created_at <= ?", Time.now).order('count(post_id) desc').pluck(:post_id)
    # yesterday_like_id = Like.includes(:user).group(:post_id).where(created_at: 1.day.ago.all_day).order('count(post_id) desc').pluck(:post_id)
    @yesterday_post_like_ranks =Post.includes(:user).where(id: yesterday_like_id , parent_id:nil).order([Arel.sql('field(id, ?)'), yesterday_like_id])
    #週間
    week_like_id = Like.includes(:user).group(:post_id).where("likes.created_at >= ?", Time.now.ago(7.days)).where("likes.created_at <= ?", Time.now).order('count(post_id) desc').pluck(:post_id)
    # week_like_id = Like.includes(:user).group(:post_id).where(created_at: Time.current.all_week).order('count(post_id) desc').pluck(:post_id)
    @week_post_like_ranks = Post.includes(:user).where(id: week_like_id ,parent_id: nil).order([Arel.sql('field(id, ?)'), week_like_id])
    #月間
    month_like_id = Like.includes(:user).group(:post_id).where("likes.created_at >= ?", Time.now.ago(30.days)).where("likes.created_at <= ?", Time.now).order('count(post_id) desc').pluck(:post_id)
    # month_like_id = Like.group(:post_id).where(created_at: Time.current.all_month).order('count(post_id) desc').pluck(:post_id)
    @month_post_like_ranks = Post.includes(:user).where(id: month_like_id, parent_id: nil).order([Arel.sql('field(id, ?)'), month_like_id])
    #年間
    year_like_id = Like.group(:post_id).where(created_at: Time.current.all_year).order('count(post_id) desc').pluck(:post_id)
    @year_post_like_ranks = Post.includes(:user).where(id: year_like_id ,parent_id: nil).order([Arel.sql('field(id, ?)'), year_like_id])
    #急上昇
    @post = Post.includes(:user).all
    # @hot_posts = Post.where(created_at: Time.current.all_day, parent_id: nil).order(impressions_count: 'DESC')
    ids = Impression.where("impressions.created_at >= ?", Time.now.yesterday).where("impressions.created_at <= ?", Time.now).group(:impressionable_id).order('count_all desc').count.keys
    @ids = Impression.where("impressions.created_at >= ?", Time.now.ago(7.days)).where("impressions.created_at <= ?", Time.now).group(:impressionable_id).order('count_all desc').count.keys
    @hot_posts = Post.includes(:user).where(id: ids,parent_id: nil).order([Arel.sql('field(id, ?)'), ids])
  end
  
  def top_super_new
    @posts = Post.includes(:user).where(parent_id: nil).order(created_at: :desc).page(params[:page]).per(20)
    # all_like_ranks_id = Like.group(:post_id).order('count(post_id) desc').pluck(:post_id)
    # @all_like_ranks = Post.includes(:user).where(id:all_like_ranks_id,parent_id: nil).order([Arel.sql('field(id, ?)'), all_like_ranks_id]).page(params[:all_like_ranks_page]).per(20)
    @all_like_ranks = Post.includes(:user).where(parent_id: nil).order(likes_count: 'DESC').page(params[:each_post_like_ranks_page]).per(20)
    @view_ranks = Post.includes(:user).where(parent_id: nil).order(impressions_count: 'DESC').page(params[:each_post_like_ranks_page]).per(20)
    @new_ranks = Post.includes(:user).where(parent_id: nil).all.order(created_at: :desc).page(params[:new_ranks_page]).per(20)
    
    if params[:tab_class] == "new_ranks"
      @new_ranks_tab = "here_tab"
      @view_ranks_tab = ""
      @all_like_ranks_tab = ""
      @new_ranks_tab_content = "here_content"
      @view_ranks_tab_content = ""
      @all_like_ranks_tab_content = ""

    elsif params[:tab_class] == "view_ranks"
      @new_ranks_tab = ""
      @view_ranks_tab = "here_tab"
      @all_like_ranks_tab = ""
      @new_ranks_tab_content = ""
      @view_ranks_tab_content = "here_content"
      @all_like_ranks_tab_content = ""

    elsif params[:tab_class] == "all_like_ranks"
      @new_ranks_tab = ""
      @view_ranks_tab = ""
      @all_like_ranks_tab = "here_tab"
      @new_ranks_tab_content = ""
      @view_ranks_tab_content = ""
      @all_like_ranks_tab_content = "here_content"

    else
      @new_ranks_tab = "here_tab"
      @view_ranks_tab = ""
      @all_like_ranks_tab = ""
      @new_ranks_tab_content = "here_content"
      @view_ranks_tab_content = ""
      @all_like_ranks_tab_content = ""
    end

  end
    
    
  

  def authenticate_user_top_my_post 
    if @current_user == nil
      redirect_to("/home/top_my_post_login")
    end
  end 

  def top_my_post_login
    
  end
  def comics_index
    @ids = Impression.where("impressions.created_at >= ?", Time.now.ago(7.days)).where("impressions.created_at <= ?", Time.now).group(:impressionable_id).order('count_all desc').count.keys
    # comic_name = Post.includes(:user).group(:Manga_name).order('count(Manga_name) desc').pluck(:Manga_name)
    # @comics = Comic.where(name: comic_name).order([Arel.sql('field(name, ?)'), comic_name]).page(params[:page]).per(20)
    @comics = Comic.order(post_count: 'DESC').page(params[:page]).per(20)
  end

  def top_my_post
    # @my_posts = Post.where(user_id: @current_user.id, parent_id: nil)
    @my_post_new_ranks = Post.includes(:user).where(user_id: @current_user.id, parent_id: nil).order(created_at: :desc).page(params[:my_post_new_ranks_page]).per(20)
    @my_post_view_ranks = Post.includes(:user).where(user_id: @current_user.id, parent_id: nil).order(impressions_count: 'DESC').page(params[:my_post_view_ranks_page]).per(20)
    # my_post_like_ranks_id = Like.group(:post_id).order('count(post_id) desc').pluck(:post_id)
    # @my_post_like_ranks = Post.includes(:user).where(id: my_post_like_ranks_id, parent_id:nil,user_id: @current_user.id).order([Arel.sql('field(id, ?)'), my_post_like_ranks_id]).page(params[:my_post_like_ranks_page]).per(20)
    @my_post_like_ranks = Post.includes(:user).where(parent_id:nil,user_id: @current_user.id).order(likes_count: 'DESC').page(params[:my_post_like_ranks_page]).per(20)

    if params[:my_post_tab_class] ==  "my_post_new_ranks"
      @my_post_new_ranks_tab  = "here_tab"
      @my_post_view_ranks_tab = ""
      @my_post_like_ranks_tab = ""
      @my_post_new_ranks_tab_content  = "here_content"
      @my_post_view_ranks_tab_content = ""
      @my_post_like_ranks_tab_content = ""

    elsif params[:my_post_tab_class] ==  "my_post_view_ranks"
      @my_post_new_ranks_tab  = ""
      @my_post_view_ranks_tab = "here_tab"
      @my_post_like_ranks_tab = ""
      @my_post_new_ranks_tab_content  = ""
      @my_post_view_ranks_tab_content = "here_content"
      @my_post_like_ranks_tab_content = ""

    elsif params[:my_post_tab_class] ==  "my_post_like_ranks"
      @my_post_new_ranks_tab  = ""
      @my_post_view_ranks_tab = ""
      @my_post_like_ranks_tab = "here_tab"
      @my_post_new_ranks_tab_content  = ""
      @my_post_view_ranks_tab_content = ""
      @my_post_like_ranks_tab_content = "here_content"

    else
      @my_post_new_ranks_tab  = "here_tab"
      @my_post_view_ranks_tab = ""
      @my_post_like_ranks_tab = ""
      @my_post_new_ranks_tab_content  = "here_content"
      @my_post_view_ranks_tab_content = ""
      @my_post_like_ranks_tab_content = ""
    end 
  end

  def search
    @search = params[:q]
    @posts = Post.where(parent_id: nil).where(['Manga_name LIKE(?) OR content LIKE(?) OR Title LIKE(?)', "%#{@search}%", "%#{@search}%", "%#{@search}%"]).page(params[:search_posts_page]).per(20)
    @comics = Comic.where(['name LIKE(?) OR kana LIKE(?) OR gana LIKE(?) OR roma LIKE(?)',"%#{@search}%","%#{@search}%", "%#{@search}%", "%#{@search}%"]).page(params[:search_comics_page]).per(20)
    @users = User.where(['name LIKE(?)',"%#{@search}%"]).page(params[:search_users_page]).per(20) 
    @ids = Impression.where("impressions.created_at >= ?", Time.now.ago(7.days)).where("impressions.created_at <= ?", Time.now).group(:impressionable_id).order('count_all desc').count.keys
    if params[:tab_class] == "search_posts"
      @search_posts_tab = "here_tab"
      @search_comics_tab = ""
      @search_users_tab = ""
      @search_posts_tab_content = "here_content"
      @search_comics_tab_content = ""
      @search_users_tab_content = ""

    elsif params[:tab_class] == "search_comics"
      @search_posts_tab = ""
      @search_comics_tab = "here_tab"
      @search_users_tab = ""
      @search_posts_tab_content = ""
      @search_comics_tab_content = "here_content"
      @search_users_tab_content = ""

    elsif params[:tab_class] == "search_users"
      @search_posts_tab = ""
      @search_comics_tab = ""
      @search_users_tab = "here_tab"
      @search_posts_tab_content = ""
      @search_comics_tab_content = ""
      @search_users_tab_content = "here_content"

    else
      @search_posts_tab = "here_tab"
      @search_comics_tab = ""
      @search_users_tab = ""
      @search_posts_tab_content = "here_content"
      @search_comics_tab_content = ""
      @search_users_tab_content = ""
    end
  end

  def user_post
    @user = User.find_by(id:params[:id])
    @my_post_new_ranks = Post.includes(:user).where(user_id: @user.id, parent_id: nil).order(created_at: :desc).page(params[:my_post_new_ranks_page]).per(20)
    @my_post_view_ranks = Post.includes(:user).where(user_id: @user.id, parent_id: nil).order(impressions_count: 'DESC').page(params[:my_post_view_ranks_page]).per(20)
    # your_post_like_ranks_id = Like.group(:post_id).order('count(post_id) desc').pluck(:post_id)
    # @my_post_like_ranks = Post.includes(:user).where(id: your_post_like_ranks_id, parent_id:nil,user_id: @user.id).order([Arel.sql('field(id, ?)'), your_post_like_ranks_id]).page(params[:my_post_like_ranks_page]).per(20)
    @my_post_like_ranks = Post.includes(:user).where(parent_id:nil,user_id: @user.id).order(likes_count: 'DESC').page(params[:my_post_like_ranks_page]).per(20)


    if params[:my_post_tab_class] ==  "my_post_new_ranks"
      @my_post_new_ranks_tab  = "here_tab"
      @my_post_view_ranks_tab = ""
      @my_post_like_ranks_tab = ""
      @my_post_new_ranks_tab_content  = "here_content"
      @my_post_view_ranks_tab_content = ""
      @my_post_like_ranks_tab_content = ""

    elsif params[:my_post_tab_class] ==  "my_post_view_ranks"
      @my_post_new_ranks_tab  = ""
      @my_post_view_ranks_tab = "here_tab"
      @my_post_like_ranks_tab = ""
      @my_post_new_ranks_tab_content  = ""
      @my_post_view_ranks_tab_content = "here_content"
      @my_post_like_ranks_tab_content = ""

    elsif params[:my_post_tab_class] ==  "my_post_like_ranks"
      @my_post_new_ranks_tab  = ""
      @my_post_view_ranks_tab = ""
      @my_post_like_ranks_tab = "here_tab"
      @my_post_new_ranks_tab_content  = ""
      @my_post_view_ranks_tab_content = ""
      @my_post_like_ranks_tab_content = "here_content"
    else
      @my_post_new_ranks_tab  = "here_tab"
      @my_post_view_ranks_tab = ""
      @my_post_like_ranks_tab = ""
      @my_post_new_ranks_tab_content  = "here_content"
      @my_post_view_ranks_tab_content = ""
      @my_post_like_ranks_tab_content = ""
    end 
  end
end