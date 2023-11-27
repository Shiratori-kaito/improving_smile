# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :require_signup

  private

  def not_authenticated
    redirect_to login_path, danger: 'ログインしてください'
  end

  def require_signup
    redirect_to login_path, danger: 'ログインしてください' unless current_user.role === 'general_user'
  end
end
