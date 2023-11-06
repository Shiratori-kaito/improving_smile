class AddReferencepToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :photo, foreign_key: true
  end
end
