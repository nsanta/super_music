class Artist < ApplicationRecord
  include OrderedByName

  has_many :albums, dependent: :destroy
  has_many :songs, dependent: :destroy
end
