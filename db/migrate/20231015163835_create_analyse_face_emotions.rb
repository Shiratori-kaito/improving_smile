class CreateAnalyseFaceEmotions < ActiveRecord::Migration[7.0]
  def change
    create_table :analyse_face_emotions do |t|
      t.references :photo, null: false, foreign_key: true
      t.string :happy
      t.string :sad
      t.string :angry
      t.string :surprised
      t.string :calm
      t.string :fear
      t.string :confused
      t.string :disgusted

      t.timestamps
    end
  end
end
