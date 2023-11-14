class Movie < ApplicationRecord
  has_many :movies_genres, dependent: :destroy
  has_many :genres, through: :movies_genres, dependent: :destroy
end
