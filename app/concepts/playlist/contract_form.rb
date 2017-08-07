class Playlist::ContractForm < Reform::Form
  property :name, validates: { presence: true, length: { maximum: 255 } }
end
