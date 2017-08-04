class Album < ApplicationRecord
  include OrderedByName

  scope :order_by_name, -> { order(name: :asc) }
  scope :by_artist, ->(artist_id) { where(artist_id: artist_id) }

  belongs_to :artist
  has_many :songs
end
