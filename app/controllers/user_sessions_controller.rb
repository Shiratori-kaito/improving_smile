class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create new guest_login]
  def new; end

  def create
    @user = login(params[:email],params[:password])
    if @user
      redirect_back_or_to root_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
  end

  def guest_login
    random_email = SecureRandom.hex(8) + '@example.com'
    random_password = SecureRandom.hex(8)
    user = User.create!(email: random_email, password: random_password, password_confirmation: random_password, name: 'ゲストユーザー', role: 'guest_user')
    auto_login(user)
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
