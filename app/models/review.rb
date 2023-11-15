# frozen_string_literal: true

# Review class definition.
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :content, presence: true
  validates :rating, numericality: true
end
