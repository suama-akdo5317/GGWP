class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @posts = current_user.posts.order(id: :desc).page(params[:page]).per(12)
  end
  
end
