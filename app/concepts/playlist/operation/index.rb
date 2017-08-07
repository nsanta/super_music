class Playlist::Index < Trailblazer::Operation
  step :index

  def index(options, **)
    options['model'] = Playlist.page(options['params']['page']).order_by_name
  end
end
