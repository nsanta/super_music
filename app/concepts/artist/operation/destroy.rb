class Artist::Destroy < Trailblazer::Operation
  step Model(Artist, :find)
  step :destroy

  def destroy(options, **)
    options['model'].destroy
  end
end
