# frozen_string_literal: true

# UsersController controller
class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { token: TokenGenerator.generate_token(user) }, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
