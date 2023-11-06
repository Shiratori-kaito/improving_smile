class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :require_login, only: %i[create new]
  skip_before_action :require_signup, only: %i[create new]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: "User was successfully created."
    else
      render :new, alert: "User was not created."
    end
  end

  def show
    @current_user = current_user
    @user = User.find(params[:id])
    @posts = @user.posts
    @followers = @user.following_users
    @liked_posts = @user.favorites

  end

  # PATCH/PUT /users/1 or /users/1.json
  


  # DELETE /users/1 or /users/1.json
  def followings
    @followings = @user.following_users
  end

  def followers
    @followers = @user.follower_users
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :avatar, :avatar_cache)
    end
end
