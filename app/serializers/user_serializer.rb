# frozen_string_literal: true

# UserSerializer definition
class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :username, :email
end
