# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController do
  let(:valid_attributes) do
    {
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password'
    }
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new User' do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new User' do
        expect do
          post :create, params: { user: { username: nil } }
        end.not_to change(User, :count)
      end
    end
  end
end
