require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    {
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password'
    }
  }

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new User" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not create a new User" do
        expect {
          post :create, params: { user: { username: nil } }
        }.not_to change(User, :count)
      end
    end


  end
end