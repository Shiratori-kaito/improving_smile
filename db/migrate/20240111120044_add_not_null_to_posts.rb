class AddNotNullToPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :analyse_face_detail_id, :bigint, null: false
    change_column :posts, :analyse_face_emotion_id, :bigint, null: false
    change_column :posts, :photo_id, :bigint, null: false
  end
end
