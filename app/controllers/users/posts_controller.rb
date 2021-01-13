class Users::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @post.post_images.build
  end

  def index
    @posts = Post.page(params[:page]).per(5).order(id: "DESC")
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = current_user
    @post_images = Post.find(params[:id]).post_images
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    # YoutubeURLの埋め込み
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    # ここまで

    if @post.save
      redirect_to posts_path, notice: "投稿に成功しました。"
    else
      render "new"
    end
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
    if @post.user == current_user
      render "edit"
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:AB, :single, :double, :triple, :HR, :RBI, :run, :BB_HBP, :steal,
                                 :inning, :hit_allowed, :run_allowed, :SO, :BB_HBP_allowed, :body, :youtube_url,
                                 :team_against, :score_my_team, :score_team_against, :date, :win_lose, post_images_post_images: [])
  end
end
