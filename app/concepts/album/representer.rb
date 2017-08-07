class Album::Representer < Roar::Decorator
  include Roar::JSON

  property :id
  property :name
  property :cover_art
end
