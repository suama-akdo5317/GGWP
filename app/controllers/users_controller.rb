class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  # before_action :set_user, only: [:show, :edit, :update]

  def show
    @user = User.find_by(id: params[:id])

    # counts(@user)
  end
  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end
  
  
  def update
    # @user.update(user_params)
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
    
  end
  
  private

=begin
  def set_user
    p params[:user_id]
    @user = User.find_by(id: params[:user_id])
=end
end
