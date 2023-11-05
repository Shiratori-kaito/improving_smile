class ChangeColumnToAnalyseFaceDetail < ActiveRecord::Migration[7.0]
  def down
    remove_column :analyse_face_details, :eye_direction_pitch
  end
end
