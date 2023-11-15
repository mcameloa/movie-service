FactoryBot.define do
  factory :movie do
    adult { Faker::Boolean.boolean }
    backdrop_path { Faker::Lorem.word }
    original_language { Faker::Lorem.word }
    original_title { Faker::Movies::HarryPotter.book }
    overview { Faker::Lorem.word }
    popularity { Faker::Lorem.word }
    poster_path { Faker::Lorem.word }
    release_date { Faker::Lorem.word }
    title { Faker::Movies::HarryPotter.book }
    video { Faker::Boolean.boolean }
    vote_average { Faker::Number.decimal(l_digits: 2) }
    vote_count { Faker::Number.digit }
  end
end
