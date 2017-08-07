class Playlist::Representer < Roar::Decorator
  include Roar::JSON

  property :id
  property :name
  collection :songs
end
