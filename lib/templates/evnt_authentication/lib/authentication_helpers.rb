# frozen_string_literal: true

# AuthenticationHelpers.
# Created by Ideo SRL on 02-09-2017.

# AuthenticationHelpers.
module AuthenticationHelpers

  # This function reads a token and return its payload.
  def read_token(token)
    body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    HashWithIndifferentAccess.new(body)
  rescue
    nil
  end

  # Authentication token:
  ##############################################################################

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

  # This function checks that an authentication token is valid and return its
  # value.
  def check_authentication_token(token, type = 'user')
    payload = read_token(token)
    return if !payload || payload[:type] != "authentication_#{type}"
    payload
  end

  # This function is a before action middelware used to check the authentication
  # token on requests and render an error if it is not present or not valid.
  # It also set an instance variable @authentication_token with the payload
  # of the token inside
  def check_authentication_token_request(type = 'user')
    unless request.headers['Authorization'].present?
      render_unauthorized_request_error
      return
    end

    @authentication_token = check_authentication_token(
      request.headers['Authorization'].present?, type
    )

    unless @authentication_token
      render_unauthorized_request_error
      return
    end

    true
  end

  # Confirm email token:
  ##############################################################################

  # This function generates and returns a secure token used to confirm
  # the email address of a specific user.
  def generate_confirm_email_token(unique_key, type = 'user', exp = 24.hours.from_now)
    payload = {
      unique_key: unique_key,
      type: "confirm_email_#{type}",
      exp: exp
    }

    # return generated token
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  # This function checks that a confirm email token is valid and return its
  # value.
  def check_confirm_email_token(token, type = 'user')
    payload = read_token(token)
    return if !payload || payload[:type] != "confirm_email_#{type}"
    payload
  end

end
