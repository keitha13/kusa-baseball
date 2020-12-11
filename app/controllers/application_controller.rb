class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when User
      posts_path
    end
  end
end
