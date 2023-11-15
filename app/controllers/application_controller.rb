# frozen_string_literal: true

# Base controller for Movie Service API Project.
class ApplicationController < ActionController::API
  def authenticate_request
    header = request.headers['Authorization']
    header = header.split.last if header
    begin
      decoded = JWT.decode(header, Rails.application.secret_key_base)
      @current_user = User.find(decoded[0]['user_id'])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { errors: ['Unauthorized access'] }, status: :unauthorized
    end
  end
end
