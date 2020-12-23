# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  before_action :reject_user, only: [:create]

  protected

  def reject_user
    if params[:user][:email].blank?
      flash[:error] = "メールアドレスを入力して下さい。"
      return
    elsif params[:user][:password].blank?
      flash[:error] = "パスワードを入力して下さい。"
      return
    end

    @user = User.find_by(email: params[:user][:email].downcase)
    if @user && @user.valid_password?(params[:user][:password]) && @user.active_for_authentication? == false
      flash[:error] = "退会済みです。"
      redirect_to new_user_session_path
    elsif @user.nil?
      flash[:error] = "ユーザーが存在しません。"
      redirect_to new_user_session_path
    end
  end
end
