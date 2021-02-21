Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'toppages#index'
  get 'toppages/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]do
    member do
      get :followings
      get :followers
    end
  end
  
  get '/mypage' => 'users#mypage'


  resources :posts
  
  resources :relationships, only: [:create, :destroy]


end
