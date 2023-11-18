# frozen_string_literal: true

# ReviewsController controller
class ReviewsController < ApplicationController
  before_action :authenticate_request

  def index
    movie_id = params[:movie_id]
    cache_key = "reviews-#{movie_id}"

    reviews_json = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      reviews = Review.where(movie_id: movie_id)
      options = { include: ['user'] }
      ReviewSerializer.new(reviews, options).serializable_hash.to_json
    end

    render json: reviews_json, status: :ok
  end

  def create
    review = Review.new(review_params)
    review.user = @current_user
    review.movie_id = params[:movie_id]
    if review.save
      Rails.cache.delete("reviews-#{review.movie_id}")
      render json: ReviewSerializer.new(review).serializable_hash.to_json, status: :created
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  def user_reviews
    options = { include: %w[user] }
    render json: ReviewSerializer.new(@current_user.reviews, options).serializable_hash.to_json, status: :ok
  end

  private

  def review_params
    params.require(:review).permit(
      :content,
      :rating
    )
  end
end
