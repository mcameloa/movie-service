# frozen_string_literal: true

# User class definition.
class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy
  validate :uniqueness

  def uniqueness
    return unless User.exists?(email:) || User.exists?(username:)

    errors.add(:user, 'User already exits')
  end
end
