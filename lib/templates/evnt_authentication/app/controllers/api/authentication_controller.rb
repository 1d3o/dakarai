# frozen_string_literal: true

# Api::AuthenticationController.
# Created by Ideo SRL on 02-09-2017.

module Api

  # AuthenticationController.
  class AuthenticationController < ApplicationController

    include AuthenticationHelpers

    # This action permits users to do the signup.
    def signup
      command = generate_signup_command

      unless command.completed?
        render_request_fail(command.error_messages.to_sentence)
        return
      end

      user = User.find_by(email: params[:email])

      render_request_success(token: generate_authentication_token(user.id))
    rescue => e
      logger.fatal e
      render_server_error('Internal server error..', info: e.to_s)
    end

    # This action permits users to do the login.
    def login
      command = generate_login_command

      unless command.completed?
        render_request_fail(command.error_messages.to_sentence)
        return
      end

      render_request_success(
        token: generate_authentication_token(command.user.id)
      )
    rescue => e
      logger.fatal e
      render_server_error('Internal server error..', info: e.to_s)
    end

    # This action permits users to confirm their emails.
    def confirm_email
      command = generate_confirm_email_command

      unless command.completed?
        render_request_fail(command.error_messages.to_sentence)
        return
      end

      render_request_success(
        token: generate_authentication_token(command.user.id)
      )
    rescue => e
      logger.fatal e
      render_server_error('Internal server error..', info: e.to_s)
    end

    private

    def generate_signup_command
      command_params = params.permit(:name, :surname, :email,
                                     :password, :password_confirmation)
      Authentication::SignupCommand.new(command_params)
    end

    def generate_login_command
      command_params = params.permit(:email, :password)
      Authentication::LoginCommand.new(command_params)
    end

    def generate_confirm_email_command
      command_params = params.permit(:token)
      Authentication::ConfirmEmailCommand.new(command_params)
    end

  end

end
