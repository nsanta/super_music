class Song < ApplicationRecord
  include OrderedByName

  belongs_to :album
  belongs_to :artist
end
