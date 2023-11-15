FactoryBot.define do
  factory :movies_genre do
    association :genre, factory: :genre
    association :movie, factory: :movie
  end
end
