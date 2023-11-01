class EditColumnForUsers < ActiveRecord::Migration[7.0]
  def down
    remove_column :users, :sns, :string
  end

  def up
    add_column :users, :role, :integer, default: 0, null: false
  end
end
