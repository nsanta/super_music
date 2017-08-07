class Artist::Show < Trailblazer::Operation
  step Model(Artist, :find)
end
