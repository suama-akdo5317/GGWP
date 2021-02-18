class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  before_action :set_user, only: [:show]

  def show
  end
  
  def update
    @user.update(user_params)
  end
  
  private

  def set_user
    @user = User.find([:id])
  end
  
end
