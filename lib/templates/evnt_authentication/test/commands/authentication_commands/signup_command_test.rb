# frozen_string_literal: true

# AuthenticationCommands::SignupCommandTest.
# Created by Ideo SRL on 02-09-2017.

require 'test_helper'

module AuthenticationCommands

  # SignupCommandTest.
  class SignupCommandTest < ActiveSupport::TestCase

    # The name, surname, email and password values should always exists and
    # should not be empty.
    ############################################################################

    def test_name_exist
      # negative example
      command = command_with_custom(:name, '')
      assert !command.completed?
    end

    def test_surname_exist
      # negative example
      command = command_with_custom(:surname, '')
      assert !command.completed?
    end

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

    # The email should have a correct format.
    ############################################################################

    def test_email_format
      # negative examples
      command = command_with_custom(:email, 'example')
      assert !command.completed?
      command = command_with_custom(:email, 'example@mail')
      assert !command.completed?
      command = command_with_custom(:email, '@mail.it')
      assert !command.completed?
      command = command_with_custom(:email, 'mail.it')
      assert !command.completed?

      # positive example
      command = command_with_custom(:email, 'test_email_format@mail.it')
      assert command.completed?
    end

    # The password should have between six and twenty characters and
    # should contain one or more numbers.
    ############################################################################

    def test_password_min_length
      # negative example
      command = command_with_password('Pass1')
      assert !command.completed?

      # positive example
      command = command_with_password('Passw1')
      assert command.completed?
    end

    def test_password_max_length
      # negative example
      command = command_with_password('Pa1' * 7)
      assert !command.completed?

      # positive example
      command = command_with_password(('Pa1' * 7)[0...-1])
      assert command.completed?
    end

    def test_password_number_presence
      # negative example
      command = command_with_password('Password')
      assert !command.completed?

      # positive example
      command = command_with_password('Password1')
      assert command.completed?
    end

    # The email should not be used by other users.
    ############################################################################

    def test_email_uniqueness
      command1 = command_with_custom
      assert command1.completed?

      command2 = command_with_custom(:email, command1.params[:email])
      assert !command2.completed?
    end

    # The email should be saved with a downcase format.
    ############################################################################

    def test_email_dowcase
      email = 'test_email_dowcase@MAIL.COM'
      command = command_with_custom(:email, email)
      assert command.completed?

      # check if user is saved with downcase email
      user = User.find_by(email: email)
      assert user.nil?
      user = User.find_by(email: email.downcase)
      assert !user.nil?
    end

    # An event should be saved with the user informations.
    # The user informations are: name, surname, email, password_digest.
    ############################################################################

    def test_event_saved
      command = command_with_custom
      assert command.completed?

      # check if event is saved on the database
      event = Event.all.last
      assert !event.nil?
      assert_equal 'authentication_signup', event.name

      # check event payload (accept eval usage on a test :D)
      payload = event.payload.is_a?(String) ? eval(event.payload) : event.payload
      assert command.params[:name], payload[:name]
      assert command.params[:surname], payload[:surname]
      assert command.params[:email], payload[:email]
    end

    # The user table should be updated with the new user informations.
    # The user password should contain the password informartions for
    # the user.
    ############################################################################

    def test_user_table_update
      command = command_with_custom
      assert command.completed?

      # check if user row is saved on database
      user = User.all.last
      assert !user.nil?
      assert command.params[:name], user.name
      assert command.params[:surname], user.surname
      assert command.params[:email], user.email

      # check if user password row is saved on database
      user_password = UserPassword.find_by(user_id: user.id)
      assert !user_password.nil?
      assert !user_password.password_digest.nil?
    end

    # The system should deliver an email to the user to request the email
    # confirmations.
    ############################################################################

    def test_confirm_email_submit
      command = command_with_custom
      assert command.completed?

      # test the confirmation email is delivered
      last_email = ActionMailer::Base.deliveries.last
      assert !last_email.nil?
      assert_equal command.params[:email], last_email.to.first
    end

    private

    # Helpers:
    ############################################################################

    def command_with_custom(key = nil, value = nil)
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
