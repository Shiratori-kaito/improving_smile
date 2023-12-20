class AddColumnToIdealFaceLandmark < ActiveRecord::Migration[7.0]
  def change
    add_column :ideal_face_landmarks, :left_pupil_x, :float
    add_column :ideal_face_landmarks, :left_pupil_y, :float
    add_column :ideal_face_landmarks, :right_pupil_x, :float
    add_column :ideal_face_landmarks, :right_pupil_y, :float
  end
end
