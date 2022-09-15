class ComicsController < ApplicationController
    before_action :authenticate_user, {only: [:new_each]}
    # before_action :ransack, {only: [:each]}

    def each
        @comic = Comic.find(params[:id])
        @show_each_comic = @comic.name
        @posts = Post.includes(:user).where(Manga_name: @comic.name , parent_id: nil).page(params[:page]).per(20)
        @each_post_new_ranks = Post.includes(:user).where(Manga_name: @comic.name, parent_id: nil).order(created_at: :desc).page(params[:each_post_new_ranks_page]).per(20)
        @each_post_view_ranks = Post.includes(:user).where(Manga_name: @comic.name, parent_id: nil).order(impressions_count: 'DESC').page(params[:each_post_view_ranks_page]).per(20)
        # each_post_like_ranks_id = Like.group(:post_id).order('count(post_id) desc').pluck(:post_id)
        # @each_post_like_ranks = Post.includes(:user).where(id:each_post_like_ranks_id, Manga_name: @comic.name ,parent_id:nil).order([Arel.sql('field(id, ?)'), each_post_like_ranks_id]).page(params[:each_post_like_ranks_page]).per(20)
        @each_post_like_ranks = Post.includes(:user).where(Manga_name: @comic.name ,parent_id:nil).order(likes_count: 'DESC').page(params[:each_post_like_ranks_page]).per(20)
        if params[:ranking] == "comics_popular_ranking"
			@ranking_label ="each_label each_ranking_label each_popular_comic_ranking"
			@ranking_id = params[:num]
			@ranking_tittle = "人気漫画ランキング"
		else
			@ranking_label = "no_ranking"
		end

        if params[:each_tab_class] == "each_post_new_ranks"
            @each_post_new_ranks_tab = "here_tab"
            @each_post_view_ranks_tab = ""
            @each_post_like_ranks_tab = ""
            @each_post_new_ranks_tab_content = "here_content"
            @each_post_view_ranks_tab_content = ""
            @each_post_like_ranks_tab_content = ""

        elsif params[:each_tab_class] == "each_post_view_ranks"
            @each_post_new_ranks_tab = ""
            @each_post_view_ranks_tab = "here_tab"
            @each_post_like_ranks_tab = ""
            @each_post_new_ranks_tab_content = ""
            @each_post_view_ranks_tab_content = "here_content"
            @each_post_like_ranks_tab_content = ""

        elsif params[:each_tab_class] == "each_post_like_ranks"
            @each_post_new_ranks_tab = ""
            @each_post_view_ranks_tab = ""
            @each_post_like_ranks_tab = "here_tab"
            @each_post_new_ranks_tab_content = ""
            @each_post_view_ranks_tab_content = ""
            @each_post_like_ranks_tab_content = "here_content"

        else
            @each_post_new_ranks_tab = "here_tab"
            @each_post_view_ranks_tab = ""
            @each_post_like_ranks_tab = ""
            @each_post_new_ranks_tab_content = "here_content"
            @each_post_view_ranks_tab_content = ""
            @each_post_like_ranks_tab_content = ""
        end

        
    end

end