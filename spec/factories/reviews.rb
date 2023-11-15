FactoryBot.define do
  factory :review do
    content { Faker::Lorem.word }
    rating { Faker::Number.decimal(l_digits: 2) }
    association :user, factory: :user
    association :movie, factory: :movie
  end
end
