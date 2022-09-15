class PostsController < ApplicationController
	before_action :authenticate_user, {only: [:edit,:update,:destroy,:create,:comment_create,:grand_create,:child_create]}
	before_action :cheack_current_user,{only: [:edit]}
	# before_action :ransack, {only: [:show]}
	impressionist :actions=> [:show]

	def index
	end
	#ひろたか書き換え
	def show
		@post = Post.find_by(id: params[:id])
		if @post.parent_id == nil
			@show_each_comic = @post.Manga_name
			@ogp_manga_name = @post.Manga_name.gsub(' ','_')
			@ogp_title = @post.Title.gsub(' ','_')
			impressionist(@post, nil, unique: [:session_hash])
			if  params[:comment_change] == "new"
				@post_comments = Post.where(parent_id: params[:id]).order(created_at: :desc)
				
			elsif params[:comment_change] == "like"
				@post_comments = Post.where(parent_id: params[:id]).order(likes_count: 'DESC')
				
			elsif params[:comment_change] == nil
				@post_comments = Post.where(parent_id: params[:id]).order(created_at: :desc)
			end
			@new_post_comments = Post.where(parent_id: params[:id]).order(created_at: :desc)
			@like_post_comments = Post.where(parent_id: params[:id]).order(likes_count: 'DESC')
			@user = User.find_by(id: @post.user_id)
			@related_posts   = Post.includes(:user).where(Manga_name: @post.Manga_name,parent_id: nil).where('posts.created_at >= ?',@post.created_at - 3.days ).where('posts.created_at <= ?',@post.created_at + 3.days ).where.not(id: @post.id).order("RAND()").limit(5)
			@related_2_posts = Post.includes(:user).where(Manga_name: @post.Manga_name,parent_id: nil).where.not(id: @post.id).order("RAND()").limit(5)
			@related_3_posts = Post.includes(:user).where(parent_id: nil).where.not(id: @post.id).order("RAND()").limit(5)
			if params[:ranking] == "hot_ranking"
				@ranking_label ="show_hot_ranking show_label show_ranking_label"
				@ranking_id = params[:num]
				@ranking_tittle = "急上昇ランキング"
			elsif params[:ranking] == "popular_ranking"
				@ranking_label ="show_popular_ranking show_label show_ranking_label"
				@ranking_id = params[:num]
				if params[:for] == "yesterday"
					@ranking_tittle = "昨日のランキング"
				elsif params[:for] == "week"
					@ranking_tittle = "週間ランキング"
				elsif params[:for] == "month"
					@ranking_tittle = "月間ランキング"
				end 
			else
				@ranking_label = "no_ranking"
			end
		else
			redirect_to("/home/top")
		end 
	end

	def comment
		@post=Post.find_by(id: params[:id])
		
	end
	
	def comment_create
		@post=Post.find_by(id: params[:id])
		@posts = Post.new(content: params[:content],Manga_name: @post.Manga_name,user_id:@current_user.try(:id),parent_id:@post.id,reply_id:@post.id,likes_count:0)
		if @posts.save
			flash[:notice]="コメントしました"
			redirect_to("/posts/#{@post.id}")
		else
			redirect_to("/posts/#{@post.id}")
		end
	end
	def child_create
		@parent_comment =Post.find_by(id: params[:id])
		@show_id = Post.find_by(id: @parent_comment.parent_id)
		@child_comment = Post.new(content: params[:content], Manga_name: @show_id.Manga_name, user_id:@current_user.id, parent_id:@parent_comment.id,reply_id:@parent_comment.id, likes_count:0)
		if @child_comment.save
			flash[:notice]="コメントしました"
			redirect_to("/posts/#{@show_id.id}")
		else
			flash[:notice]="コメントできませんでした"
			redirect_to("/posts/#{@show_id.id}")
		end
	end

	def grand_create
		@child_comment = Post.find_by(id: params[:id])
		@parent_comment = Post.find_by(id: @child_comment.parent_id)
		@show_id = Post.find_by(id: @parent_comment.parent_id)
		@grand_comment = Post.new(content: params[:content], Manga_name: @show_id.Manga_name, user_id: @current_user.id, parent_id: @parent_comment.id, reply_id:@child_comment.id, likes_count:0)
		if @grand_comment.save
			flash[:notice]="コメントしました"
			redirect_to("/posts/#{@show_id.id}")
		else
			flash[:notice]="コメントできませんでした"
			redirect_to("/posts/#{@show_id.id}")
		end
	end

	def edit
		@post = Post.find_by(id: params[:id])
	end

	def update
		@post = Post.find_by(id: params[:id])
		@parent_or_child_comment = Post.find_by(id: @post.try(:parent_id))
		@if_parent_comment = Post.find_by(id: @parent_or_child_comment.try(:parent_id))
		if @if_parent_comment.present?
			@post.content = params[:content]
			@post.save
			redirect_to("/posts/#{@if_parent_comment.id}")
			flash[:notice]="投稿を編集しました"
		elsif @post.parent_id.present?
			@post.content = params[:content]
			@post.save
			redirect_to("/posts/#{@post.parent_id}")
			flash[:notice]="投稿を編集しました"
		else
			@post.content = params[:content]
			@post.Title = params[:Title]
			if @post.save
				redirect_to("/posts/#{@post.id}")
				flash[:notice]="投稿を編集しました"
			else
				render("posts/edit")
			end
		end
	end
	
	def destroy
		@post=Post.find_by(id: params[:id])
		@post_comic = Comic.find_by(name: @post.Manga_name)
		@post_count = @post_comic.post_count-1
		@post_comic.update(post_count: @post_count)
		@post.destroy
		flash[:notice]="投稿を削除しました"
		redirect_to("/home/top")
	end 
	def child_grand_destroy
		@post=Post.find_by(id: params[:id])
		@parent_or_child_comment = Post.find_by(id: @post.try(:parent_id))
		@if_parent_comment = Post.find_by(id: @parent_or_child_comment.try(:parent_id))
		if @if_parent_comment.present?
			@post.destroy
			flash[:notice]="コメントを削除しました"
			redirect_to("/posts/#{@if_parent_comment.id}")
		else 
			@post.destroy
			@grand_comment = Post.where(parent_id: @post.id)
			@grand_comment.destroy_all
			flash[:notice]="コメントを削除しました"
			redirect_to("/posts/#{@post.parent_id}")
		end
	end 
	def create
		# @comic = Comic.find(params[:id])
		@post = Post.new(content: params[:content],Manga_name: params[:comic],user_id:@current_user.id,Title:params[:Title],likes_count:0)
		if @post.save
			@post_comic = Comic.find_by(name: @post.Manga_name)
			@post_count = @post_comic.post_count+1
            @post_comic.update(post_count: @post_count)
			flash[:notice]="投稿を作成しました"
			# showに飛べるようにする
			redirect_to("/posts/#{@post.id}")
		else
			redirect_to("/home/top")
			# redirect_back(fallback_location: root_path)
		# render("comics/new_each/#{@comic.id}")
		end
	end


	def report
		@post=Post.find_by(id: params[:id])
		
	end

	def hot_ranking
		ids = Impression.where("impressions.created_at >= ?", Time.now.yesterday).where("impressions.created_at <= ?", Time.now).group(:impressionable_id).order('count_all desc').count.keys
		@hot_posts = Post.where(id: ids).order([Arel.sql('field(id, ?)'), ids]).page(params[:page]).per(20)
	end

	def popular_comic_ranking
		@ids = Impression.where("impressions.created_at >= ?", Time.now.ago(7.days)).where("impressions.created_at <= ?", Time.now).group(:impressionable_id).order('count_all desc').count.keys
		comic_name = Post.group(:Manga_name).order('count(Manga_name) desc').pluck(:Manga_name)
		@comics = Comic.where(name: comic_name).order([Arel.sql('field(name, ?)'), comic_name]).page(params[:page]).per(20)
		if params[:ranking] == "comics_popular_ranking"
			@ranking_label ="show_hot_ranking ranking_label show_ranking_label"
			@ranking_id = params[:num]
			@ranking_tittle = "人気ランキング"
		else  
		
		end
	end

	def popular_post_ranking
		#昨日
		yesterday_like_id = Like.includes(:user).group(:post_id).where("likes.created_at >= ?", Time.now.yesterday).where("likes.created_at <= ?", Time.now).order('count(post_id) desc').pluck(:post_id)
		# yesterday_like_id = Like.group(:post_id).where(created_at: 1.day.ago.all_day).order('count(post_id) desc').pluck(:post_id)
		@yesterday_post_like_ranks =Post.where(id: yesterday_like_id , parent_id:nil).order([Arel.sql('field(id, ?)'), yesterday_like_id]).page(params[:yesterday_post_like_ranks_page]).per(20)
		#週間
		week_like_id = Like.includes(:user).group(:post_id).where("likes.created_at >= ?", Time.now.ago(7.days)).where("likes.created_at <= ?", Time.now).order('count(post_id) desc').pluck(:post_id)
		# week_like_id = Like.group(:post_id).where(created_at: Time.current.all_week).order('count(post_id) desc').pluck(:post_id)
		@week_post_like_ranks = Post.where(id: week_like_id ,parent_id: nil).order([Arel.sql('field(id, ?)'), week_like_id]).page(params[:week_post_like_ranks_page]).per(20)
		#月間
		month_like_id = Like.includes(:user).group(:post_id).where("likes.created_at >= ?", Time.now.ago(30.days)).where("likes.created_at <= ?", Time.now).order('count(post_id) desc').pluck(:post_id)
		# month_like_id = Like.group(:post_id).where(created_at: Time.current.all_month).order('count(post_id) desc').pluck(:post_id)
		@month_post_like_ranks = Post.where(id: month_like_id, parent_id: nil).order([Arel.sql('field(id, ?)'), month_like_id]).page(params[:month_post_like_ranks_page]).per(20)
		
		tab_id = params[:tab_id]
		if  params[:post_ranking_tab_class] == "yesterday_post_like_ranks"
			yesterday_tab ="here_tab"
			week_tab = ""
			month_tab = ""
			yesterday_content = "here_content"
			week_content = ""
			month_content = ""
		elsif  params[:post_ranking_tab_class] == "week_post_like_ranks"
			yesterday_tab = ""
			week_tab = "here_tab"
			month_tab = ""
			yesterday_content = ""
			week_content = "here_content"
			month_content = ""
		elsif  params[:post_ranking_tab_class] == "month_post_like_ranks"
			yesterday_tab = ""
			week_tab = ""
			month_tab = "here_tab"
			yesterday_content = ""
			week_content = ""
			month_content = "here_content"
		else
			if tab_id == "1" 
				yesterday_tab ="here_tab"
				week_tab = ""
				month_tab = ""
				yesterday_content = "here_content"
				week_content = ""
				month_content = ""
			elsif  tab_id == "2" 
				yesterday_tab = ""
				week_tab = "here_tab"
				month_tab = ""
				yesterday_content = ""
				week_content = "here_content"
				month_content = ""
			elsif tab_id == "3"
				yesterday_tab = ""
				week_tab = ""
				month_tab = "here_tab"
				yesterday_content = ""
				week_content = ""
				month_content = "here_content"
			else
				yesterday_tab ="here_tab"
				week_tab = ""
				month_tab = ""
				yesterday_content = "here_content"
				week_content = ""
				month_content = ""
			end
		end
		@yesterday_tab = yesterday_tab
		@week_tab = week_tab
		@month_tab = month_tab
		@yesterday_content = yesterday_content
		@week_content = week_content
		@month_content = month_content
	end
end