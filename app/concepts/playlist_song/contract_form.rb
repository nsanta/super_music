class PlaylistSong::ContractForm < Reform::Form
  require "reform/form/validation/unique_validator"
  include Reform::Form::ActiveModel::Validations

  property :playlist_id, validates: { presence: true }
  property :song_id, validates: { presence: true }
  validates :playlist_id, unique: {scope: [:playlist_id, :song_id]}
end
