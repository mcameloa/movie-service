# frozen_string_literal: true

# MoviesController controller
class MoviesController < ApplicationController
  before_action :authenticate_request

  def index
    movies = Movie.page(params[:page]).per(params[:per_page] || 10)
    render json: MovieSerializer.new(movies, meta: pagination_dict(movies)).serializable_hash.to_json
  end

  def show
    movie = Movie.find(params[:id])
    render json: MovieSerializer.new(movie).serializable_hash.to_json
  end

  private

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end
end
