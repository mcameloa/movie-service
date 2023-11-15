# frozen_string_literal: true
class Movie < ApplicationRecord
  has_many :movies_genres, dependent: :destroy
  has_many :genres, through: :movies_genres, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates_presence_of :title
end
