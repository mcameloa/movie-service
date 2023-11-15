# lib/token_generator.rb
module TokenGenerator
  def self.generate_token(user)
    payload = {
      user_id: user.id,
      exp: 24.hours.from_now.to_i
    }

    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
