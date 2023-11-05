class AddColumnToAnalyseFaceDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :analyse_face_details, :eye_direction_pitch, :string
  end
end
