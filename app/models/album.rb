class Album < ApplicationRecord
  scope :order_by_name, -> { order(name: :asc) }
  scope :by_artist, ->(artist_id) { where(artist_id: artist_id) }
  scope :search_by_name, ->(name) { where("NAME LIKE ?", "#{name}%") }

  belongs_to :artist
end
