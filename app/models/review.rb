# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :content, presence: true
  validates :rating, numericality: true
end
