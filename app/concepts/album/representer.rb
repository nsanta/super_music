class Album::Representer < Roar::Decorator
  include Roar::JSON

  property :id
  property :name
  property :cover_art
  property :artist, decorator: Artist::Representer
end
