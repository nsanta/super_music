class Playlist::Create < Trailblazer::Operation
  step Model(Playlist, :new)
  step Contract::Build(constant: Playlist::ContractForm)
  step Contract::Validate(key: :playlist)
  step Contract::Persist()
end
