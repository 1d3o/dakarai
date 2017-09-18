# frozen_string_literal: true

# AuthenticationCommands::RequestRecoverPassword.
# Created by Ideo SRL on 02-09-2017.

module AuthenticationCommands

  # LoginCommand.
  class RequestRecoverPassword < ApplicationCommand

    attr_reader :user

    to_validate_params do
      # check required params presence
      stop 'Email not present' if params[:email].blank?
    end

    to_validate_logic do
      # check user presence
      @user = User.find_by(email: params[:email])
      unless @user
        stop 'There are not user with the selected email'
        break
      end
    end

    to_initialize_events {} # TODO: Continue

  end

end