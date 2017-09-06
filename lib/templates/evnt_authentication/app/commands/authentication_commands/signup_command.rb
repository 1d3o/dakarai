# frozen_string_literal: true

# AuthenticationCommands::SignupCommand.
# Created by Ideo SRL on 02-09-2017.

module AuthenticationCommands

  # SignupCommand.
  class SignupCommand < ApplicationCommand

    to_validate_params do
      # check required params presence
      stop 'Name not present' if params[:name].blank?
      stop 'Surname not present' if params[:surname].blank?
      stop 'Email not present' if params[:email].blank?
      stop 'Password not present' if params[:password].blank?
      stop 'Repeated password not present' if params[:password_confirmation].blank?
    end

    to_validate_logic do
      # check password and repeated password
      psw_equal_check = params[:password] == params[:password_confirmation]
      stop 'Password and repeated password are not the same' unless psw_equal_check

      # check email validity
      email_check = params[:email].match?(VALID_EMAIL)
      stop 'Email has not a correct format' unless email_check

      # check password security
      psw_secure_check = params[:password].match?(VALID_PASSWORD)
      stop 'Password is not enought secure' unless psw_secure_check

      # check email is uniq
      email_check = !User.find_by(email: params[:email].downcase)
      stop 'Email is already used' unless email_check
    end

    to_initialize_events do
      # generate a secure password digest
      password_digest = BCrypt::Password.create(params[:password])

      # initialize event
      Authentication::SignupEvent.new(
        name: params[:name], surname: params[:surname],
        email: params[:email].downcase, password_digest: password_digest
      )
    end

  end

end
