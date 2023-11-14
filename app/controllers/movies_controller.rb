class MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: MovieSerializer.new(movies).serializable_hash.to_json
  end

  def show
    movie = Movie.find(params[:id])
    render json: MovieSerializer.new(movie).serializable_hash.to_json
  end

end
