# frozen_string_literal: true

class MoviesGenre < ApplicationRecord
  belongs_to :movie
  belongs_to :genre
end
