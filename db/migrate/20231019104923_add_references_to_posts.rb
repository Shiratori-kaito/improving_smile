# frozen_string_literal: true

class AddReferencesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :analyse_face_detail, foreign_key: true
    add_reference :posts, :analyse_face_emotion, foreign_key: true
  end
end
