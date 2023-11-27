# frozen_string_literal: true

class RenameColumnToAnalyseFaceDetail < ActiveRecord::Migration[7.0]
  def change
    rename_column :analyse_face_details, :eye_direction, :eye_direction_yaw
  end
end
