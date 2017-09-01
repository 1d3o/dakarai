# frozen_string_literal: true

module Authentication

  # LoginCommand.
  class LoginCommand < ApplicationCommand

    attr_reader :user

    to_validate_params do
      # check required params presence
      throw 'Email not present' if params[:email].blank?
      throw 'Password not present' if params[:password].blank?
    end

    to_validate_logic do
      # check user presence
      @user = Queries::User.find_by(email: params[:email])
      throw 'There are not user with the selected email' && break unless @user

      # check user password presence
      user_password = Queries::UserPassword.find_by(user_uuid: @user.uuid)
      throw 'The user password is not registered on the system' && break unless user_password

      # check password is valid
      clear_user_password = BCrypt::Password.new(user_password.password_digest)
      throw 'The password is not correct' unless params[:password] == clear_user_password
    end

    to_initialize_events {} # avoid event save

  end

end
