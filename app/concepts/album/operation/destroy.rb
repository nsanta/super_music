class Album::Destroy < Trailblazer::Operation
  step Model(Album, :find)
  step :destroy

  def destroy(options, **)
    options['model'].destroy
  end
end
