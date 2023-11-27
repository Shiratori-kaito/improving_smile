# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'tqtq0323@gmail.com'
  def reset_password_email(user)
    @user = User.find(user.id)
    @url = edit_password_reset_url(@user.reset_password_token)
    mail(to: user.email, subject: 'パスワードリセット')
  end
end
