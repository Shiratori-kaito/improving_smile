class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, :analyse_face_detail, :analyse_face_emotion).order(created_at: :desc)

  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿しました'
    else
      render :'photos/detect_faces', alert: '投稿に失敗しました'
    end
  end

  def edit
  end

  def destory
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '投稿を削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :analyse_face_detail_id, :analyse_face_emotion_id)
  end
end
