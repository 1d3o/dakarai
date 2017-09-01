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
    end

    private

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

  end

end
