class AddBlurToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :blur, :boolean, default: false, null: false
  end
end
