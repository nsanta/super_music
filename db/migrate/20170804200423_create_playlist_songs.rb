class CreatePlaylistSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :playlist_songs do |t|
      t.references :playlist, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
      t.index [:playlist_id, :song_id], unique: true
    end
  end
end
