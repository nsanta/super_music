class Song < ApplicationRecord
  include OrderedByName

  belongs_to :album
  belongs_to :artist
  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs

  scope :by_album, ->(album_id) { where(album_id: album_id) }
  scope :by_artist, ->(artist_id) { where(artist_id: artist_id) }
end
