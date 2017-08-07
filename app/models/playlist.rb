class Playlist < ApplicationRecord
  include OrderedByName

  has_many :playlist_songs, dependent: :destroy
  has_many :songs, through: :playlist_songs
end
