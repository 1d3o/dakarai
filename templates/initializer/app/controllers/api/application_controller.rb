# frozen_string_literal: true

module Api

  # ApplicationController.
  class ApplicationController < ActionController::Base
    
    skip_before_action :verify_authenticity_token

    protected

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

    # Custom logger for errors.
    def api_errors_logger
      @api_errors_logger ||= Logger.new("#{Rails.root}/log/custom/api_errors.log")
    end

  end

end
