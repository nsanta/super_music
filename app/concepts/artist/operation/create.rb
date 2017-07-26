class Artist::Create < Trailblazer::Operation
  step Model(Artist, :new)
  step Contract::Build(constant: Artist::ContractForm)
  step Contract::Validate(key: :artist)
  step Contract::Persist()
end
