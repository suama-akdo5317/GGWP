Rails.application.routes.draw do
  get 'posts/show'
  get 'posts/create'
  get 'posts/new'
  get 'posts/edit'
  get 'posts/create'
  get 'posts/update'
  get 'posts/destroy'
  devise_for :users
  root to: 'toppages#index'
  get 'toppages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

end
