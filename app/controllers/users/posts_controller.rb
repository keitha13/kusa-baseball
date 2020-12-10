class Users::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:AB, :single, :double, :triple, :HR, :RBI, :run, :BB_HBP, :steal,
    :inning, :hit_allowed, :run_allowed, :SO, :BB_HBP_allowed, :body, :post_image, :youtube_url,
    :team_against, :score_my_team, :score_team_against, :date, :win_lose)
  end
end
