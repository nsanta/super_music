FactoryGirl.define do
  factory :song do
    name { Faker::Movie.quote }
    duration { 180 }
    genre { 'Jazz' }
    album { create(:album) }
    artist { create(:artist) }
  end
end
