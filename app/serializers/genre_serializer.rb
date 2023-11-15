# frozen_string_literal: true

# GenreSerializer definition
class GenreSerializer
  include JSONAPI::Serializer
  attributes :name
end
