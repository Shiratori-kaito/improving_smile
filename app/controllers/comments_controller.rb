# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to post_path(@comment.post)
  end

  def destroy
    current_user.comments.find(params[:id]).destroy!
    redirect_to("/posts/#{params[:post_id]}")
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
