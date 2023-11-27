# frozen_string_literal: true

class RemoveSnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :sns, :string
  end
end
