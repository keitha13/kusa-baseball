class Admins::PostsController < ApplicationController
  before_action :authenticate_admins!

  def index
    @posts = Post.page(params[:page]).per(5).order(id: "DESC")
    @post_count = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_images = Post.find(params[:id]).post_images
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admins_posts_path
  end

end
