class UsersController < ApplicationController
  before_action :set_user, only: %i[show liked_posts followings followers]
  skip_before_action :require_login, only: %i[create new]
  skip_before_action :require_signup, only: %i[create new]

  def show
    @posts = @user.posts.includes(:user, :analyse_face_detail,
                                  :analyse_face_emotion).page(params[:page]).per(9).order(created_at: :desc)
    @followings = [@user.following_users]
    @followers = [@user.follower_users]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'User was successfully created.'
    else
      render :new, alert: 'User was not created.'
    end
  end

  def followings
    @followings = @user.following_users
  end

  def followers
    @followers = @user.follower_users
  end

  def liked_posts
    @liked_posts = @user.favorites.includes(:user, :analyse_face_detail,
                                            :analyse_face_emotion).page(params[:page]).per(9).order(created_at: :desc)
    @followings = [@user.following_users]
    @followers = [@user.follower_users]
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :avatar, :avatar_cache)
  end
end
