FactoryGirl.define do
  factory :artist do
    name { Faker::RockBand.name }
    bio { Faker::Lovecraft.paragraph }
  end
end
