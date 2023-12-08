# frozen_string_literal: true
class ProfilesController < ApplicationController
  include CarrierwaveBase64Uploader

  before_action :set_user, only: %i[edit update]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      if params[:user][:avatar].present?
        @user.avatar = base64_conversion(params[:user][:avatar])
        @user.save
      end
      redirect_to profile_path(@user), notice: 'プロフィールを更新しました'
    else
      flash.now[:alert] = 'プロフィールの更新に失敗しました'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :avatar, :avatar_cache)
  end
end
