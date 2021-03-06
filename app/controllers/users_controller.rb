class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
   counts(@user)
   @posts = @user.posts.order(id: :desc).page(params[:page])

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
      @user.update(update_params)
    if @user.save
      flash[:success] = '更新されました'
      redirect_to @user
    else
      flash.now[:danger] = '更新失敗'
      render :edit
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
  
  def user_params
    params.fetch(:user, {}).permit(:username, :avatar, :introduction, :how_long, :my_guiter_brand, :my_guiter_model)
  end
  
  def update_params
   params.require(:user).permit(:username, :avatar, :introduction, :how_long, :my_guiter_brand, :my_guiter_model)
  end
  
end
