# frozen_string_literal: true

# AuthenticationCommands::ConfirmEmailCommandTest.
# Created by Ideo SRL on 02-09-2017.

require 'test_helper'

module AuthenticationCommands

  # ConfirmEmailCommandTest.
  class ConfirmEmailCommandTest < ActiveSupport::TestCase

    include AuthenticationHelpers

    # The token should exist and should not be empty.
    ############################################################################

    def test_token_exist
      # negative example
      command = command_with_token('')
      assert !command.completed?
    end

    # Helpers:
    ############################################################################

    def command_with_token(token = nil)
      token = token.nil? ? generate_confirm_email_token(create_user.uuid) : token
      AuthenticationCommands::ConfirmEmailCommand.new(token: token)
    end

    def create_user
      User.create(
        uuid: SecureRandom.uuid, name: Faker::Name.first_name,
        surname: Faker::Name.last_name, email: Faker::Internet.email,
        email_confirmed: false
      )
    end

  end

end
