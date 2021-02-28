class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
   # counts(@user)
  end
  
  def mypage
    redirect_to user_path(current_user)
  end
  
  
  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end
  
  
  def update
    current_user.update(update_params)

  end
  
  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
  
  def user_params
    params.fetch(:user, {}).permit(:username, :avatar)
  end
  
  def update_params
   params.require(:user).permit(:avatar)
  end
  
end
