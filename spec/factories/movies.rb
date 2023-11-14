FactoryBot.define do
  factory :movie do
    adult { false }
    backdrop_path { "MyString" }
    id { "" }
    primary_key { "MyString" }
    original_language { "MyString" }
    original_title { "MyString" }
    overview { "MyText" }
    popularity { "9.99" }
    poster_path { "MyString" }
    release_date { "2023-11-12" }
    title { "MyString" }
    video { false }
    vote_average { "9.99" }
    vote_count { 1 }
  end
end
