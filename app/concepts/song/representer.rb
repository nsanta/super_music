class Song::Representer < Roar::Decorator
  include Roar::JSON

  property :id
  property :name
  property :duration
  property :genre
end
