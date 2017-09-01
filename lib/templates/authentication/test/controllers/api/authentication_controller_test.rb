# frozen_string_literal: true

require 'test_helper'

module Api

  # AuthenticationControllerTest.
  class AuthenticationControllerTest < ActionDispatch::IntegrationTest

    # The password on signup should contain a number and a capitalize letter.
    # A not valid passwords are: "password!", "password1", "Password".
    def test_signup_password_security_without_special_chars
      response = send_simple_request(
        :post,
        api_authentication_signup_path(
          signup_password_security_without_special_chars_params
        )
      )

      # check response failed
      assert_equal false, response[:result]
    end

    # The password on signup should contain six or more chars.
    # A not valid passwords are: "Pa1!".
    def test_signup_password_security_without_correct_min_length
      response = send_simple_request(
        :post,
        api_authentication_signup_path(
          signup_password_security_without_correct_min_length_params
        )
      )

      # check response failed
      assert_equal false, response[:result]
    end

    # The password on signup should contain not more than twenty chars.
    # A not valid passwords are: "Pa1g1g1g1g1g1g1g1g1g1".
    def test_signup_password_security_without_correct_max_length
      response = send_simple_request(
        :post,
        api_authentication_signup_path(
          signup_password_security_without_correct_max_length_params
        )
      )

      # check response failed
      assert_equal false, response[:result]
    end

    # The password should be accepted when it meets the security
    # requirements.
    # A valid passwords are: "Password1", "F00bar"
    def test_signup_password_security_valid
      response = send_simple_request(
        :post,
        api_authentication_signup_path(
          signup_password_security_valid_params
        )
      )

      # check response succeeded
      assert_equal true, response[:result]

      # check response contain a token
      assert_not_nil response[:payload][:token]
    end

    def test_login
      response = send_simple_request(
        :post,
        api_authentication_login_path(login_params)
      )

      puts JSON.pretty_generate response

      # check response succeeded
      assert_equal true, response[:result]

      # check response contain a token
      assert_not_nil response[:payload][:token]
    end

    private

    # Params:
    # ##########################################################################

    def signup_password_security_without_special_chars_params
      { name: 'Foo', surname: 'Bar', email: 'foo@bar.com',
        password: 'password', password_confirmation: 'password' }
    end

    def signup_password_security_without_correct_min_length_params
      { name: 'Foo', surname: 'Bar', email: 'foo@bar.com',
        password: 'Pa1!', password_confirmation: 'Pa1!' }
    end

    def signup_password_security_without_correct_max_length_params
      { name: 'Foo', surname: 'Bar', email: 'foo@bar.com',
        password: 'Pa1g1g1g1g1g1g1g1g1g1',
        password_confirmation: 'Pa1g1g1g1g1g1g1g1g1g1' }
    end

    def signup_password_security_valid_params
      { name: 'Foo', surname: 'Bar', email: 'foo@bar.com',
        password: 'Password1', password_confirmation: 'Password1' }
    end

    def login_params
      generator = generate_user_and_user_password_for_login
      { email: generator[:user].email, password: generator[:password] }
    end

    # Generators:
    # ##########################################################################

    def generate_user_and_user_password_for_login
      # select password
      password = 'Password1'

      # create user and user password
      user = Queries::User.create(
        uuid: SecureRandom.uuid, name: Faker::Name.first_name,
        surname: Faker::Name.last_name, email: Faker::Internet.email
      )
      user_password = Queries::UserPassword.create(
        user_uuid: user.uuid,
        password_digest: BCrypt::Password.create(password, cost: 10)
      )

      # return generated data
      { user: user, user_password: user_password, password: password }
    end

  end

end
