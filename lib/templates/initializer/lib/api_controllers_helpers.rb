# frozen_string_literal: true

# ApiControllersHelpers.
# Updated by Gregorio Galante on 02-09-2017.

# ApiControllersHelpers.
module ApiControllersHelpers

  # This function render a normal success response with a custom payload.
  def render_request_success(payload)
    response = { result: true, error_message: nil }
    response[:payload] = payload if payload
    render json: response
  end

  # This function render an error message with a possible custom payload.
  def render_request_fail(error, payload: nil)
    response = { result: false, error_message: error }
    response[:payload] = payload if payload
    render json: response
  end

  # This function render an error for a bad request with an error message.
  def render_bad_request_error(error)
    render json: { result: false, error_message: error }, status: 400
  end

  # Tis function render an error for an unauthorized request with
  # an error message.
  def render_unauthorized_request_error(error)
    render json: { result: false, error_message: error }, status: 401
  end

  # This function render an error object as an api response with
  # the error informations.
  def render_server_error(error, error_object)
    render json: {
      result: false,
      error_message: error,
      error_info: error_object.to_s
    }, status: 500
  end

end
