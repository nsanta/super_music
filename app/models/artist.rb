class Artist < ApplicationRecord
  has_many :albums

  scope :order_by_name, -> { order(name: :asc) }
end
