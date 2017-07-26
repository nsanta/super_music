class Artist::Representer < Roar::Decorator
  include Roar::JSON

  property :id
  property :name
  property :bio
end
