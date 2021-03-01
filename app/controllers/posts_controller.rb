class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @posts = current_user.posts.order(id: :desc).page(params[:page]).per(9)
  end
  
  def new
    @post = Post.new
  end
    
  def show
    @post = Post.find_by(id: params[:id])
    @like = Like.new
    @comments = @post.comments
    @comment = current_user.comments.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿しました'
      redirect_to root_url
    else
      @mosts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end
  
  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      flash[:success] = '更新されました'
      redirect_to @post
    else
      @posts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '投稿を削除しました。'
      redirect_to root_url
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

  def post_params
    params.require(:post).permit(:title, :content, image: [])
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end

end
