class Album::Create < Trailblazer::Operation
  step Model(Album, :new)
  step Contract::Build(constant: Album::ContractForm)
  step Contract::Validate(key: :album)
  step Contract::Persist()
end
