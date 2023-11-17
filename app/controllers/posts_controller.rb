class PostsController < ApplicationController 
  before_action :set_post, only: [:show, :destroy]
  def index
    @posts = Post.includes(:user, :analyse_face_detail, :analyse_face_emotion).page(params[:page]).per(9).order(created_at: :desc)

  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿しました'
    else
      render :'photos/detect_faces', alert: '投稿に失敗しました'
    end
  end

  def show
    @user = User.find(@post.user_id)
    @current_user = current_user
    @analyse_face_detail = AnalyseFaceDetail.find(@post.analyse_face_detail_id)
    @analyse_face_emotion = AnalyseFaceEmotion.find(@post.analyse_face_emotion_id)
    @data = {
      "喜び" => @analyse_face_emotion.happy,
      "悲しむ" => @analyse_face_emotion.sad,
      "怒り" => @analyse_face_emotion.angry,
      "驚き" => @analyse_face_emotion.surprised,
      "落ち着き" => @analyse_face_emotion.calm,
      "恐れ" => @analyse_face_emotion.fear,
      "混乱" => @analyse_face_emotion.confused,
      "嫌悪" => @analyse_face_emotion.disgusted
    }
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @comment = current_user.comments.new
    @favorite_counts = @post.favorites.count
  end

  def destroy
    @post.destroy
  end
  

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :blur, :user_id, :analyse_face_detail_id, :analyse_face_emotion_id, :photo_id)
  end
end
