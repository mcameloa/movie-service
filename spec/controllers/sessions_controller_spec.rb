# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController do
  let(:user) { create(:user) }
  let(:password) { 'password' }

  describe 'POST #create' do
    context 'with valid credentials' do
      it 'returns a success response' do
        post :create, params: { email: user.email, password: }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid credentials' do
      it 'returns a unauthorized response' do
        post :create, params: { email: user.email, password: '123' }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
