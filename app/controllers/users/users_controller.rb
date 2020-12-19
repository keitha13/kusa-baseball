class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    # 通算成績算出用
    posts = current_user.posts
    @total_AB = posts.sum(:AB)
    @total_single = posts.sum(:single)
    @total_double = posts.sum(:double)
    @total_triple = posts.sum(:triple)
    @total_HR = posts.sum(:HR)
    @total_RBI = posts.sum(:RBI)
    @total_run = posts.sum(:run)
    @total_BB_HBP = posts.sum(:BB_HBP)
    @total_steal = posts.sum(:steal)
    @total_inning = posts.sum(:inning)
    @total_hit_allowed = posts.sum(:hit_allowed)
    @total_run_allowed = posts.sum(:run_allowed)
    @total_SO = posts.sum(:SO)
    @total_BB_HBP_allowed = posts.sum(:BB_HBP_allowed)

    total_hits = @total_single + @total_double + @total_triple + @total_HR
    @ave = total_hits / @total_AB.to_f

    # チャット
    if user_signed_in?
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        unless @isRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end

  def edit
    @user = User.find(params[:id])

    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def quit
  end

  def out
    @user = current_user
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page])
    render 'show_followings'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'show_followers'
  end

  private

  def user_params
    params.require(:user).permit(:name, :birthday, :profile_image, :introduction,
                                 :active_area, :email, :team)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
