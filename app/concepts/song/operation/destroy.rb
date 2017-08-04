class Song::Destroy < Trailblazer::Operation
  step Model(Song, :find)
  step :destroy

  def destroy(options, **)
    options['model'].destroy
  end
end
