# frozen_string_literal: true

class ReviewSerializer
  include JSONAPI::Serializer
  attributes :content, :rating, :created_at
end