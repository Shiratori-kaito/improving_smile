class CreateAnalyseFaceLandmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :analyse_face_landmarks do |t|
        t.integer :nose_x
        t.integer :nose_y
        t.integer :nose_left_x
        t.integer :nose_left_y
        t.integer :nose_right_x
        t.integer :nose_right_y
        t.integer :mouth_left_x
        t.integer :mouth_left_y
        t.integer :mouth_right_x
        t.integer :mouth_right_y
        t.integer :mouth_up_x
        t.integer :mouth_up_y
        t.integer :mouth_down_x
        t.integer :mouth_down_y
        t.integer :left_eye_brow_left_x
        t.integer :left_eye_brow_left_y
        t.integer :left_eye_brow_right_x
        t.integer :left_eye_brow_right_y
        t.integer :right_eye_brow_left_x
        t.integer :right_eye_brow_left_y
        t.integer :right_eye_brow_right_x
        t.integer :right_eye_brow_right_y
        t.integer :right_eye_brow_up_x
        t.integer :right_eye_brow_up_y
        t.integer :left_eye_brow_up_x
        t.integer :left_eye_brow_up_y
        t.integer :eye_left_x
        t.integer :eye_left_y
        t.integer :eye_right_x
        t.integer :eye_right_y
        t.integer :left_eye_up_x
        t.integer :left_eye_up_y
        t.integer :left_eye_down_x
        t.integer :left_eye_down_y
        t.integer :left_eye_left_x
        t.integer :left_eye_left_y
        t.integer :left_eye_right_x
        t.integer :left_eye_right_y
        t.integer :right_eye_up_x
        t.integer :right_eye_up_y
        t.integer :right_eye_down_x
        t.integer :right_eye_down_y
        t.integer :right_eye_left_x
        t.integer :right_eye_left_y
        t.integer :right_eye_right_x
        t.integer :right_eye_right_y
        t.integer :left_eye_pupil_x
        t.integer :left_eye_pupil_y
        t.integer :right_eye_pupil_x
        t.integer :right_eye_pupil_y
        t.integer :upper_jawline_left_x
        t.integer :upper_jawline_left_y
        t.integer :upper_jawline_right_x
        t.integer :upper_jawline_right_y
        t.integer :mid_jawline_left_x
        t.integer :mid_jawline_left_y
        t.integer :mid_jawline_right_x
        t.integer :mid_jawline_right_y
        t.integer :chin_bottom_x
        t.integer :chin_bottom_y
        t.timestamps
    end
  end
end
