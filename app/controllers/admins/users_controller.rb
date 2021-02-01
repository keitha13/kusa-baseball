class Admins::UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
  end

  def edit
  end

  def update
  end

end
