class Song::Index < Trailblazer::Operation
  step :index

  def index(options, **)
    options['model'] = Song.order_by_name
    if options['params']['name'].present?
      options['model'] = options['model'].search_by_name(options['params']['name'])
    end

    if options['params']['album_id'].present?
      options['model'] = options['model'].by_album(options['params']['album_id'])
    end

    if options['params']['artist_id'].present?
      options['model'] = options['model'].by_artist(options['params']['artist_id'])
    end
    
    options['model'] = options['model'].page(options['params']['page'])
  end
end
