# frozen_string_literal: true

# AuthenticationCommands::LoginCommandTest.
# Created by Ideo SRL on 11-10-2017.

# The login command is used to validate the user password.

require 'test_helper'

module AuthenticationCommands

  # LoginCommandTest.
  class LoginCommandTest < ActiveSupport::TestCase

    # The email and password values should always exists and
    # should not be empty.
    ############################################################################

    def test_email_exist
      # negative example
      command = command_with_custom(:email, '')
      assert !command.completed?
    end

    def test_password_exist
      # negative example
      command = command_with_custom(:password, '')
      assert !command.completed?
    end

    # TODO: Need more tests

    private

    # Helpers:
    ############################################################################

    def command_with_custom(key = nil, value = nil)
      AuthenticationCommands::LoginCommand.new(
        email: key == :email ? value : create_user.email,
        password: key == :password ? value : 'P4ssw0rd!'
      )
    end

    def create_user
      user = User.create(
        uuid: SecureRandom.uuid, name: Faker::Name.first_name,
        surname: Faker::Name.last_name, email: Faker::Internet.email,
        email_confirmed: true
      )
      UserPassword.create(
        user_uuid: user.uuid,
        password_digest: BCrypt::Password.create('P4ssw0rd!')
      )

      user
    end

  end

end
