class Admins::UsersController < ApplicationController
  before_action :authenticate_admins!

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5).order(id: "DESC")

    # 通算成績算出用
    @total_AB = @posts.sum(:AB)
    @total_single = @posts.sum(:single)
    @total_double = @posts.sum(:double)
    @total_triple = @posts.sum(:triple)
    @total_HR = @posts.sum(:HR)
    @total_RBI = @posts.sum(:RBI)
    @total_run = @posts.sum(:run)
    @total_BB_HBP = @posts.sum(:BB_HBP)
    @total_steal = @posts.sum(:steal)
    @total_inning = @posts.sum(:inning)
    @total_hit_allowed = @posts.sum(:hit_allowed)
    @total_run_allowed = @posts.sum(:run_allowed)
    @total_SO = @posts.sum(:SO)
    @total_BB_HBP_allowed = @posts.sum(:BB_HBP_allowed)

    total_hits = @total_single + @total_double + @total_triple + @total_HR
    @ave = total_hits / @total_AB.to_f

    @era = @total_run_allowed * 9.00 / @total_inning
  end

  def edit
  end

  def update
  end

end
