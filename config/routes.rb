Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'toppages/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/show' => 'users#show'
  resources :users, only: [:show]


  resources :posts


end
