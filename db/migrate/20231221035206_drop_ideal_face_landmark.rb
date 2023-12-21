class DropIdealFaceLandmark < ActiveRecord::Migration[7.0]
  def change
    drop_table :ideal_face_landmarks
  end
end
