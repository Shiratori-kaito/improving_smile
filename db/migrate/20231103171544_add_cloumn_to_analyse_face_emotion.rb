class AddCloumnToAnalyseFaceEmotion < ActiveRecord::Migration[7.0]
  def change
    add_column :analyse_face_emotions, :emotion_comment, :text
  end
end
