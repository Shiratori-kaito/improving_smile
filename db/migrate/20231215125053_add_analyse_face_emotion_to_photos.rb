class AddAnalyseFaceEmotionToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :analyse_face_landmarks, :photo, foreign_key: true
  end
end
