# spec/controllers/reviews_controller_spec.rb
require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }
  let(:valid_attributes) { { content: "Great movie", rating: 5.0 } }
  let(:invalid_attributes) { { content: nil, rating: "1" } }

  before do
    request.headers['Authorization'] = "Bearer #{TokenGenerator.generate_token(user)}"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new Review" do
        expect {
          post :create, params: { review: valid_attributes, movie_id: movie.id }
        }.to change(Review, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not create a new Review" do
        expect {
          post :create, params: { review: invalid_attributes, movie_id: movie.id }
        }.not_to change(Review, :count)
      end
    end
  end

  describe "GET #index" do
    it "returns all reviews for a movie" do
      create(:review, movie_id: movie.id, user: user)
      get :index, params: { movie_id: movie.id }
      expect(response).to be_successful
    end
  end

  describe "GET #user_reviews" do
    it "returns reviews by the current user" do
      create_list(:review, 3, user: user)
      get :user_reviews
      expect(response).to be_successful
    end
  end
end
