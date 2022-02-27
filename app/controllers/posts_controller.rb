class PostsController < ApplicationController
	before_action :authenticate_user, {only: [:edit,:update,:destroy,:create]}
	before_action :ransack, {only: [:show]}
	def index
	end
	
	#ひろたか書き換え
	def show
		@post = Post.find_by(id: params[:id])
		@likes_count = Like.where(post_id: @post.id).count
		@posts = Post.where(parent_id: params[:id])
	
	end
	def comment
		@post=Post.find_by(id: params[:id])
		
	end
	
	def comment_create
		@post=Post.find_by(id: params[:id])
		@posts = Post.new(content: params[:content],Manga_name: @post.Manga_name,user_id:@current_user.id,parent_id:@post.id)
		if @posts.save
			flash[:notice]="コメントしました"
			redirect_to("/posts/#{@post.id}")
		else
			render("posts/#{@post.id}")
	end
	end
	
	def edit
		@post = Post.find_by(id: params[:id])
	end
	
	def update
		@post = Post.find_by(id: params[:id])
		@post.content = params[:content]
		if @post.save
			redirect_to("/ONE_PIECE")
			flash[:notice]="投稿を編集しました"
		else
			render("posts/edit")
		end
	end
	
	def destroy
		@post=Post.find_by(id: params[:id])
		@post.destroy
		flash[:notice]="投稿を削除しました"
		redirect_to("/ONE_PIECE")
	end 
	
	def create
		@comic = Comic.find(params[:id])
		@post = Post.new(content: params[:content],Manga_name: @comic.name,user_id:@current_user.id)
		if @post.save
			flash[:notice]="投稿を作成しました"
			redirect_to("/each/#{@comic.id}")
		
		else
		render("comics/new_each/#{@comic.id}")
		end
	end

end