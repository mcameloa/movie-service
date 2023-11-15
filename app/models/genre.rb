# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :movies_genres, dependent: :destroy
  has_many :movies, through: :movies_genres, dependent: :destroy
end
