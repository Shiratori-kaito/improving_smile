class CreateIdealFaceLandmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :ideal_face_landmarks do |t|
    
      t.timestamps
    end
  end
end
