# frozen_string_literal: true

FactoryBot.define do
  factory :movies_genre do
    genre factory: %i[genre]
    movie factory: %i[movie]
  end
end
