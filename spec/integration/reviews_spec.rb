require 'swagger_helper'

RSpec.describe 'Reviews API', type: :request do
  path '/movies/{id}/reviews' do
    post 'create a review movie' do
      tags 'Reviews'
      consumes 'application/json'
      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: :string, description: 'id'
      parameter name: 'Authorization', in: :header, type: :string, required: true
      parameter name: :review, in: :body, schema: {
        type: :object,
        properties: {
          review: {
            type: :object,
            properties: {
              content: { type: :string },
              rating: { type: :decimal },
            }
          }
        },
        required: %w[content rating]
      }

      let(:user) { create(:user) }
      let(:movie) { create(:movie) }
      let(:Authorization) { TokenGenerator.generate_token(user) }
      let(:valid_attributes) do
        {
          content: Faker::Lorem.word,
          rating: Faker::Number.decimal(l_digits: 2)
        }
      end

      response(201, 'review created') do
        let(:id) { movie.id }
        let(:review) { { review: valid_attributes } }
        run_test!
      end
    end

    get 'get movie reviews' do
      tags 'Reviews'
      consumes 'application/json'
      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: :string, description: 'id'
      parameter name: 'Authorization', in: :header, type: :string, required: true
      let(:user) { create(:user) }
      let(:movie) { create(:movie) }
      let(:Authorization) { TokenGenerator.generate_token(user) }

      response(200, 'review list') do
        let(:id) { movie.id }
        run_test!
      end
    end
  end
  path '/users/reviews' do
    get 'get user reviews' do
      tags 'Reviews'
      consumes 'application/json'
      security [bearerAuth: []]
      parameter name: 'Authorization', in: :header, type: :string, required: true

      let(:user) { create(:user) }
      let(:Authorization) { TokenGenerator.generate_token(user) }

      response(200, 'user reviews list') do
        run_test!
      end
    end
  end

end