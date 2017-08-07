class Song::ContractForm < Reform::Form
  include Reform::Form::ActiveModel::Validations

  GENRES = %w[jazz rock pop metal classic blues].freeze

  property :name, validates: { presence: true, length: { maximum: 255 } }
  property :duration, validates: { numericality: { greater_than: 0 } }
  property :genre, validates: { inclusion: { in: GENRES } }
  property :artist_id, validates: { presence: true }
  property :album_id, validates: { presence: true }
end
