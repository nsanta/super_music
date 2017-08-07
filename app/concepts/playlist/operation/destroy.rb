class Playlist::Destroy < Trailblazer::Operation
  step Model(Playlist, :find)
  step :destroy

  def destroy(options, **)
    options['model'].destroy
  end
end
