class Song::Update < Trailblazer::Operation
  step Model(Song, :find)
  step Contract::Build(constant: Song::ContractForm)
  step Contract::Validate(key: :song)
  step Contract::Persist()
end
