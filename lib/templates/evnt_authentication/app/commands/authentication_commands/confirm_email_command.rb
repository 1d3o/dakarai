# frozen_string_literal: true

# AuthenticationCommands::LoginCommand.
# Created by Ideo SRL on 04-09-2017.

module AuthenticationCommands

  # ConfirmEmailCommand.
  class ConfirmEmailCommand < ApplicationCommand

    include AuthenticationHelpers

    attr_reader :user

    to_validate_params do
      # check required params presence
      stop 'Token not present' if params[:token].blank?
    end

    to_validate_logic do
      # check token is valid
      token = check_confirm_email_token(params[:token])
      unless token
        stop 'Token not valid'
        break
      end

      # find user and check if needs a confirmation
      @user = User.find_by(id: token[:unique_key])
      unless @user
        stop 'User not valid for the token'
        break
      end
      if @user.email_confirmed
        stop 'Email already confirmed'
        break
      end
    end

    to_initialize_events do
      # initialize event
      AuthenticationEvents::ConfirmEmailEvent.new(
        user_id: @user.id,
        email: @user.email,
        _user: @user
      )
    end

  end

end
