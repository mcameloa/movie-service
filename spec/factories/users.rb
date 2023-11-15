# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.user }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
