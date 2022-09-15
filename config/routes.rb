Rails.application.routes.draw do
  # get 'images/ogp'
  root 'home#top'
  # get 'posts/index' => "posts#index"
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  

  #ひろたか変更12/26

  # get 'users/inquiry' => "users#inquiry"
  get 'home/top'  => "home#top"
  post 'home/top' => "home#top"
  get "login" => "users#login"
  post "login" => "users#login_date"
  post "logout" => "users#logout"
  get "users/shinki" => "users#shinki"
  post "users/create_user" => "users#create_user"

  #ひろたか書き換え
  get "posts/:id", to:"posts#show", as: :post_show
  get "posts/:id/edit", to: "posts#edit", as: :post_edit
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  post "posts/:id/child_grand_destroy" => "posts#child_grand_destroy"
  # get "posts/:id/comment" => "posts#comment"
  post "posts/comment_create/:id" => "posts#comment_create" 
  #ひろたか書き換え2
  get "users/top_favorite", to: "users#top_favorite", as: :top_favorite 
  get "home/top_my_post", to: "home#top_my_post", as: :top_my_post
  get "home/top_super_new", to: "home#top_super_new", as: :top_super_new
  get "home/search", to: "home#search", as: :home_search
  get "home/user_post/:id", to:  "home#user_post", as: :user_post
  get "home/comics_index", to: "home#comics_index", as: :comics_index
  
    #hirotaka 12/26
  get "comics/each/:id", to:"comics#each", as: :comics_each
  # get "comics/new_each/:id" => "comics#new_each"
  post "posts/create" => "posts#create"
  post "posts/create/:id" => "posts#create"
  get  "each/:id" => "comics#each" 
  
  post "posts/report/:id" => "posts#report"
  get "posts/report/:id", to: "posts#report", as: :post_report
  post "reports/create/:id" => "reports#create"
  post "posts/grand_create/:id" => "posts#grand_create"
  # post "posts/grand_show/:id" => "posts#grand_show" 
  post "posts/child_create/:id" => "posts#child_create"
  get "home/top_my_post_login" => "home#top_my_post_login"
  get "users/top_favorite_login" => "users#top_favorite_login"
  #hirotaka 4/26
  post "users/change_like" => "users#change_like"
  post "users/change_read" => "users#change_read"
  post "users/change_pass" => "users#change_pass"
  post "users/change_name" => "users#change_name"
  post "users/change_image" => "users#change_image"

  get "hot_ranking", to:  "posts#hot_ranking" , as: :hot_ranking
  get "popular_comic_ranking", to: "posts#popular_comic_ranking" ,as: :popular_comic_ranking
  get "popular_post_ranking", to:"posts#popular_post_ranking", as: :popular_post_ranking
  get "home/user_post/:id" => "home#user_post"
  get "users/default/:id" => "users#default"
  get 'images/ogp/:manga/:title', to: 'images#ogp'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
