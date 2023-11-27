# frozen_string_literal: true

class AddPitchToEyeDirection < ActiveRecord::Migration[7.0]
  def up
    change_column :analyse_face_details, :eye_direction_pitch, 'integer USING CAST(eye_direction_pitch AS integer)'
  end

  def down
    change_column :analyse_face_details, :eye_direction_pitch, :string
  end
end
