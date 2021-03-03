Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'toppages#index'
  get 'toppages/show'

  devise_for :users

  # ゲストログイン用
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :edit, :update]do
    member do
      get :followings
      get :followers
    end
  end
  
  get '/mypage' => 'users#mypage'


  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  resources :relationships, only: [:create, :destroy]

end
