# frozen_string_literal: true

# This module contains functions used to help the development of API.
module ApisHelpers

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

  # This function render an error message with the errors contained
  # on an entity.
  def render_entity_error(entity)
    render_request_fail(entity.errors.full_messages.to_sentence)
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

end
