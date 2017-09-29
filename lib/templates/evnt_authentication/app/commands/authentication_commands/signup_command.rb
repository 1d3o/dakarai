# frozen_string_literal: true

# AuthenticationCommands::SignupCommand.
# Created by Ideo SRL on 02-09-2017.

module AuthenticationCommands

  # SignupCommand.
  class SignupCommand < ApplicationCommand

    validates :name, type: :string, presence: true
    validates :surname, type: :string, presence: true
    validates :email, type: :string, presence: true
    validates :password, type: :string, presence: true
    validates :password_confirmation, type: :string, presence: true

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
      # generate a secure uuid
      uuid = SecureRandom.uuid

      # generate a secure password digest
      password_digest = BCrypt::Password.create(params[:password])

      # initialize event
      AuthenticationEvents::SignupEvent.new(
        uuid: uuid, name: params[:name], surname: params[:surname],
        email: params[:email].downcase, password_digest: password_digest
      )
    end

  end

end
