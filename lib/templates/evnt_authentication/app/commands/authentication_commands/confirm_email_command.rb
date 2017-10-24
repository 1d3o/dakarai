# frozen_string_literal: true

# AuthenticationCommands::ConfirmEmailCommand.
# Created by Ideo SRL on 04-09-2017.

module AuthenticationCommands

  # ConfirmEmailCommand.
  class ConfirmEmailCommand < ApplicationCommand

    include AuthenticationHelpers

    attr_reader :user

    validates :token, type: :string, presence: true, blank: false

    to_validate_logic do
      # check token is valid
      token = check_confirm_email_token(params[:token])
      unless token
        err 'Token not valid'
        break
      end

      # find user and check if needs a confirmation
      @user = User.find_by(uuid: token[:unique_key])
      unless @user
        err 'User not valid for the token'
        break
      end
      if @user.email_confirmed
        err 'Email already confirmed'
        break
      end
    end

    to_initialize_events do
      # initialize event
      AuthenticationEvents::ConfirmEmailEvent.new(
        user_uuid: @user.uuid,
        email: @user.email,
        _user: @user
      )
    end

  end

end
