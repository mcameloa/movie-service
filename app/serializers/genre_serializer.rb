# frozen_string_literal: true

class GenreSerializer
  include JSONAPI::Serializer
  attributes :name
end