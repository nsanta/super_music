FactoryGirl.define do
  factory :playlist do
    name { Faker::RockBand.name }
  end
end
