# frozen_string_literal: true

require 'test_helper'

module Api

  # AuthenticationControllerTest.
  class AuthenticationControllerTest < ActionDispatch::IntegrationTest

    # The password on signup should contain a number and a capitalize letter.
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

    # The password on signup should contain siz or more chars.
    def test_signup_password_security_without_correct_length
      response = send_simple_request(
        :post,
        api_authentication_signup_path(
          signup_password_security_without_correct_length_params
        )
      )
      # check response failed
      assert_equal false, response[:result]
    end

    private

    def signup_password_security_without_special_chars_params
      { name: 'Foo', surname: 'Bar', email: 'foo@bar.com',
        password: 'password', password_confirmation: 'password' }
    end

    def signup_password_security_without_correct_length_params
      { name: 'Foo', surname: 'Bar', email: 'foo@bar.com',
        password: 'Pa1!', password_confirmation: 'Pa1!' }
    end

  end

end
