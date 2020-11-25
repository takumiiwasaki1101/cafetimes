FactoryBot.define do
  factory :review do
    date { Faker::Date.in_date_period }
    tool_id { Faker::Number.within(range: 1..11) }    
    review { Faker::Lorem.sentence }
    association :user
    association :coffee
  end
end
