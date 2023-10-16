class CreateAnalyseFaceDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :analyse_face_details do |t|
      t.references :photo, null: false, foreign_key: true
      t.integer :smile
      t.boolean :sunglass
      t.integer :eye_open
      t.integer :mouth_open
      t.integer :eye_direction

      t.timestamps
    end
  end
end
