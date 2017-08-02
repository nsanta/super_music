class Artist < ApplicationRecord
  scope :order_by_name, -> { order(name: :asc) }
end
