# frozen_string_literal: true

require 'test_helper'

module Authentication

  # SignupCommandTest.
  class SignupCommandTest < Minitest::Test

    # The name, surname, email and password values should always exists and
    # should not be empty.
    ############################################################################

    def test_name_exist
      # negative example
      command = command_with_custom(:name, '')
      assert_equal false, command.completed?

      # positive example
      command = command_with_custom(:name, 'Pippo')
      assert_equal true, command.completed?
    end

    def test_surname_exist
      # negative example
      command = command_with_custom(:surname, '')
      assert_equal false, command.completed?

      # positive example
      command = command_with_custom(:surname, 'Baudo')
      assert_equal true, command.completed?
    end

    # The Signup password should have between six and twenty characters and
    # should contain one or more numbers.
    ############################################################################

    def test_password_min_length
      # negative example
      command = command_with_password('Pass1')
      assert_equal false, command.completed?

      # positive example
      command = command_with_password('Passw1')
      assert_equal true, command.completed?
    end

    def test_password_max_length
      # negative example
      command = command_with_password('Pa1' * 7)
      assert_equal false, command.completed?

      # positive example
      command = command_with_password(('Pa1' * 7)[0...-1])
      assert_equal true, command.completed?
    end

    def test_password_number_presence
      # negative example
      command = command_with_password('Password')
      assert_equal false, command.completed?

      # positive example
      command = command_with_password('Password1')
      assert_equal true, command.completed?
    end

    private

    # Helpers:
    ############################################################################

    def command_with_custom(key, value)
      Authentication::SignupCommand.new(
        name: key == :name ? value : Faker::Name.first_name,
        surname: key == :surname ? value : Faker::Name.last_name,
        email: key == :email ? value : Faker::Internet.email,
        password: key == :password ? value : 'Password1',
        password_confirmation: key == :password ? value : 'Password1'
      )
    end

    def command_with_password(password)
      Authentication::SignupCommand.new(
        name: Faker::Name.first_name, surname: Faker::Name.last_name,
        email: Faker::Internet.email, password: password,
        password_confirmation: password
      )
    end

  end

end
