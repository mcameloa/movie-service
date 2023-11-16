require 'swagger_helper'

RSpec.describe 'Sessions API', type: :request do
  path '/sessions' do
    post 'Log in' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string },
            }
          }
        },
        required: %w[email password]
      }

      let(:info) { create(:user) }

      response '200', 'success' do
        let(:user) { { user: { email: info.email, password: 'password' } } }
        run_test!
      end

      response '401', 'unauthorized' do
        let(:user) { { user: { email: 'a@mail.com', password: '123' } } }
        run_test!
      end
    end
  end
end