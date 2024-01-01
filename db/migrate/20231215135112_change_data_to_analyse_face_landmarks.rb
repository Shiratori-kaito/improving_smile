class ChangeDataToAnalyseFaceLandmarks < ActiveRecord::Migration[7.0]
  def change
    change_column :analyse_face_landmarks, :nose_x, :float
    change_column :analyse_face_landmarks, :nose_y, :float
    change_column :analyse_face_landmarks, :nose_left_x, :float
    change_column :analyse_face_landmarks, :nose_left_y, :float
    change_column :analyse_face_landmarks, :nose_right_x, :float
    change_column :analyse_face_landmarks, :nose_right_y, :float
    change_column :analyse_face_landmarks, :mouth_left_x, :float
    change_column :analyse_face_landmarks, :mouth_left_y, :float
    change_column :analyse_face_landmarks, :mouth_right_x, :float
    change_column :analyse_face_landmarks, :mouth_right_y, :float
    change_column :analyse_face_landmarks, :mouth_up_x, :float
    change_column :analyse_face_landmarks, :mouth_up_y, :float
    change_column :analyse_face_landmarks, :mouth_down_x, :float
    change_column :analyse_face_landmarks, :mouth_down_y, :float
    change_column :analyse_face_landmarks, :left_eye_brow_left_x, :float
    change_column :analyse_face_landmarks, :left_eye_brow_left_y, :float
    change_column :analyse_face_landmarks, :left_eye_brow_right_x, :float
    change_column :analyse_face_landmarks, :left_eye_brow_right_y, :float
    change_column :analyse_face_landmarks, :right_eye_brow_left_x, :float
    change_column :analyse_face_landmarks, :right_eye_brow_left_y, :float
    change_column :analyse_face_landmarks, :right_eye_brow_right_x, :float
    change_column :analyse_face_landmarks, :right_eye_brow_right_y, :float
    change_column :analyse_face_landmarks, :right_eye_brow_up_x, :float
    change_column :analyse_face_landmarks, :right_eye_brow_up_y, :float
    change_column :analyse_face_landmarks, :left_eye_brow_up_x, :float
    change_column :analyse_face_landmarks, :left_eye_brow_up_y, :float
    change_column :analyse_face_landmarks, :eye_left_x, :float
    change_column :analyse_face_landmarks, :eye_left_y, :float
    change_column :analyse_face_landmarks, :eye_right_x, :float
    change_column :analyse_face_landmarks, :eye_right_y, :float
    change_column :analyse_face_landmarks, :left_eye_up_x, :float
    change_column :analyse_face_landmarks, :left_eye_up_y, :float
    change_column :analyse_face_landmarks, :left_eye_down_x, :float
    change_column :analyse_face_landmarks, :left_eye_down_y, :float
    change_column :analyse_face_landmarks, :left_eye_left_x, :float
    change_column :analyse_face_landmarks, :left_eye_left_y, :float
    change_column :analyse_face_landmarks, :left_eye_right_x, :float
    change_column :analyse_face_landmarks, :left_eye_right_y, :float
    change_column :analyse_face_landmarks, :right_eye_up_x, :float
    change_column :analyse_face_landmarks, :right_eye_up_y, :float
    change_column :analyse_face_landmarks, :right_eye_down_x, :float
    change_column :analyse_face_landmarks, :right_eye_down_y, :float
    change_column :analyse_face_landmarks, :right_eye_left_x, :float
    change_column :analyse_face_landmarks, :right_eye_left_y, :float
    change_column :analyse_face_landmarks, :right_eye_right_x, :float
    change_column :analyse_face_landmarks, :right_eye_right_y, :float
    change_column :analyse_face_landmarks, :left_pupil_x, :float
    change_column :analyse_face_landmarks, :left_pupil_y, :float
    change_column :analyse_face_landmarks, :right_pupil_x, :float
    change_column :analyse_face_landmarks, :right_pupil_y, :float
    change_column :analyse_face_landmarks, :upper_jawline_left_x, :float
    change_column :analyse_face_landmarks, :upper_jawline_left_y, :float
    change_column :analyse_face_landmarks, :upper_jawline_right_x, :float
    change_column :analyse_face_landmarks, :upper_jawline_right_y, :float
    change_column :analyse_face_landmarks, :mid_jawline_left_x, :float
    change_column :analyse_face_landmarks, :mid_jawline_left_y, :float
    change_column :analyse_face_landmarks, :mid_jawline_right_x, :float
    change_column :analyse_face_landmarks, :mid_jawline_right_y, :float
    change_column :analyse_face_landmarks, :chin_bottom_x, :float
    change_column :analyse_face_landmarks, :chin_bottom_y, :float
  end
end