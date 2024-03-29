class PasswordResetsController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_signup

  def new; end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    not_authenticated if @user.blank?
  end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to login_path, notice: 'パスワードリセットメールを送信しました'
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    return not_authenticated if @user.blank?

    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.password.present? && @user.password == @user.password_confirmation
      if @user.change_password(params[:user][:password])
        redirect_to login_path, notice: 'パスワードを更新しました'
      else
        flash.now[:alert] = 'パスワードの再設定に失敗しました'
        render :edit
      end
    else
      flash.now[:alert] = 'パスワードが一致しません'
      render :edit
    end
  end
end
