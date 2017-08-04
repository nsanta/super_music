class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :cover_art
      t.references :artist, foreign_key: true
      t.timestamps
      t.index :name
    end
  end
end
