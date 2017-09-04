# frozen_string_literal: true

# AuthenticationHelpers.
# Created by Ideo SRL on 02-09-2017.

# AuthenticationHelpers.
module AuthenticationHelpers

  # This function generates and returns a secure authentication token
  # with a payload inside.
  def generate_authentication_token(unique_key, type = 'user', exp = 24.hours.from_now)
    payload = {
      unique_key: unique_key,
      type: "authentication_#{type}",
      exp: exp
    }

    # return generated token
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  # This function reads an authentication token and return its
  # payload.
  def read_authentication_token(token)
    body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    HashWithIndifferentAccess.new(body)
  rescue
    nil
  end

  # This function check the current request token content is valid
  # and render an error if it's not valid.
  # If the request is valid it save the token payload on an
  # @authentication_token variable.
  def check_authentication_request_token(type = 'user')
    unless request.headers['Authorization'].present?
      render_unauthorized_request_error
      return
    end

    @authentication_token = read_authentication_token(
      request.headers['Authorization'].split(' ').last
    )

    if !@authentication_token ||
       @authentication_token[:type] != "authentication_#{type}"
      render_unauthorized_request_error
      return
    end
  end

end
