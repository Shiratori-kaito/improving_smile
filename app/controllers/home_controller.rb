class HomeController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  skip_before_action :require_signup, only: %i[index]
  def index;end
end
