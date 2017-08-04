class Album::Show < Trailblazer::Operation
  step Model(Album, :find)
end
