class PasswordResetsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to login_path, notice: 'パスワードリセットメールを送信しました'
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    return not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    return not_authenticated if @user.blank?

    # 次の行は、パスワード確認の検証を機能させます
    @user.password_confirmation = params[:user][:password_confirmation]
    # 次の行は一時トークンをクリアし、パスワードを更新します
    if @user.change_password(params[:user][:password])
      redirect_to login_path, notice: 'パスワードを更新しました'
    else
      flash.now[:danger] = "パスワードの再設定に失敗しました"
      render :edit
    end
  end
end
