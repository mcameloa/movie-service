require 'swagger_helper'

RSpec.describe 'Movies API', type: :request do
  path '/movies' do
    get 'list movies' do
      tags 'Movies'
      consumes 'application/json'
      security [bearerAuth: []]
      parameter name: 'page', in: :path, type: :string, description: 'page'
      parameter name: 'per_page', in: :path, type: :string, description: 'per_page'
      parameter name: 'Authorization', in: :header, type: :string, required: true

      let(:user) { create(:user) }
      let(:Authorization) { TokenGenerator.generate_token(user) }

      response(200, 'successful') do
        let(:page) { 1 }
        let(:per_page) { 10 }
        run_test!
      end
    end
  end

  path '/movies/{id}' do
    get 'show movie' do
      tags 'Movies'
      consumes 'application/json'
      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: :string, description: 'id'
      parameter name: 'Authorization', in: :header, type: :string, required: true

      let(:user) { create(:user) }
      let(:Authorization) { TokenGenerator.generate_token(user) }
      let(:movie) { create(:movie) }

      response(200, 'successful') do
        let(:id) { movie.id }
        run_test!
      end
    end
  end
end
