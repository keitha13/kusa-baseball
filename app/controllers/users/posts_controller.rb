class Users::PostsController < ApplicationController
  def new
    @post = Post.new
    @user = current_user
  end

  def index
    @search = Post.ransack(params[:q])
    @posts = @search.result
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    # YoutubeURLの埋め込み
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    # ここまで

    @post.save
    redirect_to posts_path
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
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:AB, :single, :double, :triple, :HR, :RBI, :run, :BB_HBP, :steal,
    :inning, :hit_allowed, :run_allowed, :SO, :BB_HBP_allowed, :body, :post_image, :youtube_url,
    :team_against, :score_my_team, :score_team_against, :date, :win_lose)
  end
end
