class AddColumnToAnalyseFaceLandmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :analyse_face_landmarks, :left_pupil_x, :integer
    add_column :analyse_face_landmarks, :left_pupil_y, :integer
    add_column :analyse_face_landmarks, :right_pupil_x, :integer
    add_column :analyse_face_landmarks, :right_pupil_y, :integer
  end
end
