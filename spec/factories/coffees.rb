FactoryBot.define do
  factory :coffee do
    name { Faker::Coffee.country }
    country_id { Faker::Number.within(range: 1..21) }
    date_of_purchase { Faker::Date.in_date_period }
    shop { Faker::Restaurant.name }
    detail { Faker::Lorem.sentence }
    association :user
  end
end
