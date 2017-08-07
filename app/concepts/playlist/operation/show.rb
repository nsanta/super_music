class Playlist::Show < Trailblazer::Operation
  step Model(Playlist, :find)
end
