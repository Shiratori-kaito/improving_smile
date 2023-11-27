# frozen_string_literal: true

class AddColumnToFaceDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :analyse_face_details, :agerange_low, :string
    add_column :analyse_face_details, :agerange_high, :string
  end
end
