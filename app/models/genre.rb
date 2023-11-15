# frozen_string_literal: true

# Genre class definition.
class Genre < ApplicationRecord
  has_many :movies_genres, dependent: :destroy
  has_many :movies, through: :movies_genres, dependent: :destroy
end
