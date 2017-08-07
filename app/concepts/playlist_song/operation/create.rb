class PlaylistSong::Create < Trailblazer::Operation
  step Model(PlaylistSong, :new)
  step Contract::Build(constant: PlaylistSong::ContractForm)
  step Contract::Validate(key: :playlist_song)
  step Contract::Persist()
end
