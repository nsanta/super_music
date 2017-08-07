class Song::Index < Trailblazer::Operation
  step :index

  def index(options, **)
    options['model'] = Song.page(options['params']['page']).order_by_name
    if options['params']['name'].present?
      options['model'] = options['model'].search_by_name(options['params']['name'])
    end
  end
end