FactoryBot.define do
  factory :review do
    date { Faker::Date.in_date_period }
    tool_id { Faker::Number.within(range: 1..10) }
    amount_of_coffee { Faker::Number.within(range: 1..100) }
    amount_of_water { Faker::Number.within(range: 100..900) }
    pre_infusion_time { Faker::Number.within(range: 10..120) }
    extraction_time { Faker::Number.within(range: 1..600) }
    review { Faker::Lorem.sentence }
    association :user
    association :coffee
  end
end
