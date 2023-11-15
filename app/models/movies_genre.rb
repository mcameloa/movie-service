# frozen_string_literal: true

# MoviesGenre class definition.
class MoviesGenre < ApplicationRecord
  belongs_to :movie
  belongs_to :genre
end
