class Album::Update < Trailblazer::Operation
  step Model(Album, :find)
  step Contract::Build(constant: Album::ContractForm)
  step Contract::Validate(key: :album)
  step Contract::Persist()
end
