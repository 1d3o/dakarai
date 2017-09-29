# frozen_string_literal: true

# AuthenticationCommands::LoginCommand.
# Created by Ideo SRL on 02-09-2017.

module AuthenticationCommands

  # LoginCommand.
  class LoginCommand < ApplicationCommand

    attr_reader :user

    validates :email, type: :string, presence: true, blank: false
    validates :password, type: :string, presence: true, blank: false

    to_validate_logic do
      # check user presence
      @user = User.find_by(email: params[:email])
      unless @user
        err 'There are not user with the selected email'
        break
      end

      # check user password presence
      user_password = UserPassword.find_by(user_uuid: @user.uuid)
      unless user_password
        err 'The user password is not registered on the system'
        break
      end

      # check password is valid
      clear_user_password = BCrypt::Password.new(user_password.password_digest)
      unless clear_user_password == params[:password]
        err 'The password is not correct'
        break
      end
    end

    to_initialize_events {} # avoid event save

  end

end
