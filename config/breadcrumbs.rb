crumb :root do
  link "ホーム", root_path
end
crumb :each do | comic |
  link "【#{comic.name}】", comics_each_path(comic.id)
  parent :root 
end

crumb :comics_index do
  link "漫画一覧", comics_index_path
  parent :root 
end

crumb :top_super_new do
  link "投稿一覧",  top_super_new_path
  parent :root 
end

crumb :top_favorite do
  link "お気に入り", top_favorite_path
  parent :root 
end

crumb :top_my_post do
  link "マイページ", top_my_post_path
  parent :root 
end

crumb :hot_ranking do
  link "急上昇ランキング", hot_ranking_path
  parent :root 
end

crumb :popular_comic_ranking do
  link "人気漫画ランキング", popular_comic_ranking_path 
  parent :root 
end

crumb :popular_post_ranking do
  link "人気投稿ランキング", popular_post_ranking_path
  parent :root 
end

crumb :home_search do |search|
  link "#{search}の検索結果", home_search_path(search)
  parent :root 
end

crumb :user_post do |user|
  link "#{user}のページ", user_post_path(user)
  parent :root 
end
crumb :post_show do |post|
  link "#{post.Title}", post_show_path(post.id)
  comic = Comic.find_by(name: post.Manga_name)
  parent :each,comic
end

crumb :post_edit do |post|
  if post.parent_id == nil  #親
    link "投稿の編集", post_edit_path(post)
    parent :post_show, post
  else
    #postが子供コメントだった場合
    if Post.find_by(id:post.parent_id).parent_id == nil 
      parent_post = Post.find_by(id:post.parent_id)
        link "コメントの編集", post_edit_path(parent_post)
        parent :post_show, parent_post
      else 
          #postが孫だった場合
          child_post = Post.find_by(id:post.parent_id)
          mago_parent_post = Post.find_by(id: child_post.parent_id)
          link "コメントの編集", post_edit_path(mago_parent_post)
          parent :post_show, mago_parent_post
      end
  end 
end

crumb :post_report do |post|
  link "通報", post_report_path(post)
  parent :post_show, post
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).