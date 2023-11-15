# frozen_string_literal: true

# ReviewSerializer definition
class ReviewSerializer
  include JSONAPI::Serializer
  attributes :content, :rating, :created_at
end
