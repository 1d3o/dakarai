# frozen_string_literal: true

# AuthenticationControllersHelpers.
module AuthenticationControllersHelpers

  # This function generates and returns a secure authentication token
  # with a payload inside.
  def generate_authentication_token(unique_key, exp = 24.hours.from_now)
    payload = {
      unique_key: unique_key,
      type: 'authentication',
      exp: exp
    }

    # return generated token
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

end
