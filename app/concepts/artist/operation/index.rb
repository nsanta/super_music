class Artist::Index < Trailblazer::Operation
  step :index

  def index(options, **)
    options['model'] = Artist.page(options['params']['page']).order_by_name
  end
end
