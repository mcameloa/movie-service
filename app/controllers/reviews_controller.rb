# frozen_string_literal: true

# ReviewsController controller
class ReviewsController < ApplicationController
  before_action :authenticate_request

  def index
    reviews = Review.find_by movie_id: params[:movie_id]
    render json: ReviewSerializer.new(reviews).serializable_hash.to_json, status: :ok
  end

  def create
    review = Review.new(review_params)
    review.user = @current_user
    review.movie_id = params[:movie_id]
    if review.save
      render json: ReviewSerializer.new(review).serializable_hash.to_json, status: :created
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  def user_reviews
    render json: ReviewSerializer.new(@current_user.reviews).serializable_hash.to_json, status: :ok
  end

  private

  def review_params
    params.require(:review).permit(
      :content,
      :rating
    )
  end
end
