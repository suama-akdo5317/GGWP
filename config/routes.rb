Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'toppages/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/show'
  resources :users, only: [:show]



  resources :posts
  get 'posts/show'
  get 'posts/create'
  get 'posts/new'
  get 'posts/edit'
  get 'posts/create'
  get 'posts/update'
  get 'posts/destroy'

end
