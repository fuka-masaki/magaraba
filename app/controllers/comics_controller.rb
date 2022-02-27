class ComicsController < ApplicationController
    before_action :authenticate_user, {only: [:new_each]}
    before_action :ransack, {only: [:each]}
    def show
    end

    def each
        @comic = Comic.find(params[:id])
        @posts = Post.where(Manga_name: @comic.name)
    end

    def new_each
        @comic = Comic.find(params[:id])
        @post=Post.new
    end
end