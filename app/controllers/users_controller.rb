class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  before_action :set_user, only: [:show]

  def show
    counts(@user)
  end
  
  def update
    @user.update(user_params)
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end
  
end
