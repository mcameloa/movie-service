# frozen_string_literal: true

# User class definition.
class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_secure_password
end
