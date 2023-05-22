Rails.application.routes.draw do
  root 'users#index'
  get 'users' => 'users#index', as: 'users'
  get 'users/:id' => 'users#show', as: 'user'
  get 'users/:id/posts' => 'posts#index', as: 'user_posts'
  get 'users/:id/posts/:post_id' => 'posts#show', as: 'user_post'
end
