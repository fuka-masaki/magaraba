Rails.application.routes.draw do
  get 'posts/index' => "posts#index"
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  
  #ひろたか変更12/26

  get 'users/inquiry' => "users#inquiry"
  get 'home/top'    => "home#top"
  get "login" => "users#login"
  post "login" => "users#login_date"
  post "logout" => "users#logout"
  
  get "users/shinki" => "users#shinki"
  post "users/create_user" => "users#create_user"

    #ひろたか書き換え
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "posts/:id/comment" => "posts#comment"
  post "posts/comment_create/:id" => "posts#comment_create"
    #ひろたか書き換え2
  get "users/:id/top_favorite" => "users#top_favorite"
  get "home/top_my_post" => "home#top_my_post"
  get "home/top_super_new" => "home#top_super_new"
  get "home/search" => "home#search"
  
    #hirotaka 12/26
  get "comics/each/:id", to:"comics#each", as: :comics_each
  get "comics/new_each/:id" => "comics#new_each"
  post "posts/create/:id" => "posts#create"
  get  "each/:id" => "comics#each" 
  
  
  
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
