class ToppagesController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC").page(params[:page]).per(10)
  end

  def show
    @user = User.find_by(id: params[:id])

  end
end
