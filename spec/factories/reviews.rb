FactoryBot.define do
  factory :review do
    date { Faker::Date.in_date_period }
    review { Faker::Lorem.sentence }
    association :user    
    association :coffee    
  end
end
