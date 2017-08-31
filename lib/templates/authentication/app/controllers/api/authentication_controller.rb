# frozen_string_literal: true

module Api

  # AuthenticationController.
  class AuthenticationController < ApplicationController

    include AuthenticationControllersHelpers

    def signup
      command = generate_signup_command

      unless command.completed?
        render_request_fail(command.error_messages.to_sentence)
        return
      end

      user = Queries::User.find_by(email: params[:email])

      render_request_success(token: generate_authentication_token(user.uuid))
    rescue => e
      render_server_error('Internal server error..', info: e.to_s)
    end

    def login

    end

    private

    def generate_signup_command
      command_params = params.permit(:name, :surname, :email,
                                     :password, :password_confirmation)
      Command.new(command_params)
    end

  end

end
