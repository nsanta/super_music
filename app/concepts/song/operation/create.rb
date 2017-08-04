class Song::Create < Trailblazer::Operation
  step Model(Song, :new)
  step Contract::Build(constant: Song::ContractForm)
  step Contract::Validate(key: :song)
  step Contract::Persist()
end
