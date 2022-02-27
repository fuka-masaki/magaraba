class HomeController < ApplicationController
  before_action :ransack,{only: [:top,:top_super_new,:top_my_post,:search]}
  before_action :authenticate_user, {only: [:top_my_post]}
  def top

  end
  
  def top_super_new
  end

  
  def top_my_post
    @my_posts = Post.where(user_id: @current_user.id)
  end

  def search

  end
end
