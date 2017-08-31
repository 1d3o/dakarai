# frozen_string_literal: true

module Authentication

  # SignupCommand.
  class SignupCommand < ApplicationCommand

    to_validate_params do
      # check required params presence
      throw 'Name not present' if params[:name].blank?
      throw 'Surname not present' if params[:name].blank?
      throw 'Email not present' if params[:email].blank?
      throw 'Password not present' if params[:password].blank?
      throw 'Repeated password not present' if params[:password_confirmation].blank?
    end

    to_validate_logic do
      # check password and repeated password
      psw_equal_check = params[:password] == params[:password_confirmation]
      throw 'Password and repeated password are not the same' unless psw_equal_check

      # check password security
      psw_secure_check = params[:password].match?(VALID_PASSWORD)
      throw 'Password is not enought secure' unless psw_secure_check

      # check email is uniq
      email_check = !User.find_by(email: params[:email].downcase)
      throw 'Email is already used' unless email_check
    end

    to_initialize_events do
      # generate a secure uuid
      uuid = SecureRandom.uuid

      # generate a secure password digest
      # NOTE: changing password cost will be more slow but more secure
      password_digest = BCrypt::Password.create(params[:password], cost: 10)

      # initialize event
      Authentication::SignupEvent.new(
        uuid: uuid, name: params[:name], surname: params[:surname],
        email: params[:email], password_digest: password_digest
      )
    end

  end

end
