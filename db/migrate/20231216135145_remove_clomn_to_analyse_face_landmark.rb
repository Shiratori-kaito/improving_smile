class RemoveClomnToAnalyseFaceLandmark < ActiveRecord::Migration[7.0]
  def change
    remove_column :ideal_face_landmarks, :left_eye_pupil_x, :integer
    remove_column :ideal_face_landmarks, :left_eye_pupil_y, :integer
    remove_column :ideal_face_landmarks, :right_eye_pupil_x, :integer
    remove_column :ideal_face_landmarks, :right_eye_pupil_y, :integer
  end
end
