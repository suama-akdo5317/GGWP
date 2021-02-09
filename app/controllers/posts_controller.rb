class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :destroy]
  
  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def new
    @post = Post.new

  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = '投稿しました'
      redirect_to root_url
    else
      @mosts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました'
      render 'toppages/index'
    end
  end

  def update
  end

  def destroy
    @post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def micropost_params
    params.require(:post).permit(:title, :content, :image)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end

end
