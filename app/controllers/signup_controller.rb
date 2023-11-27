# frozen_string_literal: true

class SignupController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_signup

  def step1
    @user = User.new
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    # step1で入力された値を元にuserインスタンスを作成
    @user = User.new
  end

  def create
    @user = User.new(
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      name: user_params[:name],
      avatar: user_params[:avatar]
    )
    if @user.save
      session[:id] = @user.id
      auto_login(@user)
      redirect_to root_path, notice: 'ユーザー登録が完了しました'
    else
      flash.now[:alert] = 'ユーザー登録に失敗しました'
      render :step1
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :avatar, :avatar_cache)
  end
end
