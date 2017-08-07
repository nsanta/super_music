class Playlist::Update < Trailblazer::Operation
  step Model(Playlist, :find)
  step Contract::Build(constant: Playlist::ContractForm)
  step Contract::Validate(key: :playlist)
  step Contract::Persist()
end
