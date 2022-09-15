class LikesController < ApplicationController

    def create
        @post = Post.find_by(id: params[:post_id])
        l=@post.likes_count+1
        @post.update(likes_count: l)
        @post.save
        @like = Like.new(user_id: @current_user.try(:id) , post_id: params[:post_id] )
        @like.save  
        # redirect_to("/posts/#{params[:post_id]}")
    end

    def destroy
        @post = Post.find_by(id: params[:post_id])
        post_like_destroy = @post.likes_count - 1
        @post.update(likes_count: post_like_destroy)
        @like = Like.find_by(user_id: @current_user.try(:id) , post_id: params[:post_id])
        @like.destroy   
        # redirect_to("/posts/#{params[:post_id]}")  
    end
end