# frozen_string_literal: true

# SessionsController controller
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      render json: { token: TokenGenerator.generate_token(user) }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  private

  def session_params
    params.require(:user).permit(
      :email,
      :password
    )
  end
end
