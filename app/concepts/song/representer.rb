class Song::Representer < Roar::Decorator
  include Roar::JSON

  property :id
  property :name
  property :duration
  property :genre
  property :artist, decorator: Artist::Representer
  property :album, decorator: Album::Representer
end
