class Album::ContractForm < Reform::Form
  property :name, validates: { presence: true, length: { maximum: 255 } }
  property :cover_art
  property :artist_id, validates: { presence: true }
end
