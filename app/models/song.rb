class Song < ApplicationRecord
  include OrderedByName

  belongs_to :album
  belongs_to :artist
  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs
end
