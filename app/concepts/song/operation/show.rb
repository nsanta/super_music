class Song::Show < Trailblazer::Operation
  step Model(Song, :find)
end
