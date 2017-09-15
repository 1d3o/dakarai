# frozen_string_literal: true

# AuthenticationCommands::LoginCommand.
# Created by Ideo SRL on 02-09-2017.

module AuthenticationCommands

  # LoginCommand.
  class LoginCommand < ApplicationCommand

    attr_reader :user

    to_validate_params do
      # check required params presence
      stop 'Email not present' if params[:email].blank?
      stop 'Password not present' if params[:password].blank?
    end

    to_validate_logic do
      # check user presence
      @user = User.find_by(email: params[:email])
      unless @user
        stop 'There are not user with the selected email'
        break
      end

      # check user password presence
      user_password = UserPassword.find_by(user_id: @user.id)
      unless user_password
        stop 'The user password is not registered on the system'
        break
      end

      # check password is valid
      clear_user_password = BCrypt::Password.new(user_password.password_digest)
      unless clear_user_password == params[:password]
        stop 'The password is not correct'
        break
      end
    end

    to_initialize_events {} # avoid event save

  end

end
