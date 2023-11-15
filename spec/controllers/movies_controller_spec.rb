# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviesController do
  let(:user) { create(:user) }
  let!(:movies) { create_list(:movie, 3) }

  before do
    request.headers['Authorization'] = "Bearer #{TokenGenerator.generate_token(user)}"
  end

  describe 'GET #index' do
    it 'returns a unauthorized response' do
      request.headers['Authorization'] = ''
      get :index
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'returns a list of movies' do
      get :index
      expect(response.parsed_body['data'].size).to eq(3)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      movie = movies.first
      get :show, params: { id: movie.id }
      expect(response).to be_successful
    end
  end
end
