class Artist < ApplicationRecord
  include OrderedByName

  has_many :albums
  has_many :songs
end
