# frozen_string_literal: true

# Movie class definition.
class Movie < ApplicationRecord
  has_many :movies_genres, dependent: :destroy
  has_many :genres, through: :movies_genres, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
end
