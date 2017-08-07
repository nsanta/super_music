class Artist::Update < Trailblazer::Operation
  step Model(Artist, :find)
  step Contract::Build(constant: Artist::ContractForm)
  step Contract::Validate(key: :artist)
  step Contract::Persist()
end
