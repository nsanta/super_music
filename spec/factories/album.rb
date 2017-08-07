FactoryGirl.define do
  factory :album do
    name { Faker::Overwatch.quote }
    cover_art { "URL" }
    artist { create(:artist) }
  end
end
