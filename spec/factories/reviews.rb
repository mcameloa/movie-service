# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    content { Faker::Lorem.word }
    rating { Faker::Number.decimal(l_digits: 2) }
    user factory: %i[user]
    movie factory: %i[movie]
  end
end
