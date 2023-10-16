class RemoveImageFromPhoto < ActiveRecord::Migration[7.0]
  def change
    remove_column :photos, :image, :string
  end
end
