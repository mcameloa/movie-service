class MovieSerializer
  include JSONAPI::Serializer
  attributes :title,
             :overview,
             :release_date,
             :adult,
             :backdrop_path,
             :original_language,
             :original_title,
             :popularity,
             :poster_path,
             :video,
             :vote_average,
             :vote_count

  has_many :genres
end
