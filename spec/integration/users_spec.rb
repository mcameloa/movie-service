require 'swagger_helper'

describe 'Registration API' do
  path '/users' do
    post 'Create user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string },
        },
        required: %w[username email password password_confirmation]
      }

      let(:valid_attributes) do
        {
          username: Faker::Internet.username,
          email: Faker::Internet.email,
          password: 'password',
          password_confirmation: 'password'
        }
      end

      response(201, 'user created') do
        let(:user) { { user: valid_attributes } }
        run_test!
      end

      response(422, 'invalid request') do
        let(:user) { { user: { email: nil } } }
        run_test!
      end
    end
  end
end