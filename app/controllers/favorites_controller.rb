class FavoritesController < ApplicationController
  before_action :set_post, only: [:destroy]

  def create
    @favorite = current_user.favorites.new(post_id: params[:post_id])
    @favorite.save
  end

  def destroy
    favorite = @post.favorites.find_by(user_id: current_user.id)
    favorite.destroy!

  end
end

def set_post
  @post = Post.find(params[:post_id])
end