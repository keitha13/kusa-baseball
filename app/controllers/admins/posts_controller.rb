class Admins::PostsController < ApplicationController
  
  def index 
    @posts = Post.page(params[:page]).per(5).order(id: "DESC")
  end
  
end
