# frozen_string_literal: true

require 'test_helper'

module Api

  # AuthenticationControllerTest.
  class AuthenticationControllerTest < ActionDispatch::IntegrationTest

    def test_signup
      response = send_simple_request(
        :post, api_authentication_signup_path(signup_params)
      )

      puts JSON.pretty_generate response
    end

    private

    def signup_params
      { name: 'Foo', surname: 'Bar', email: 'foo@bar.com',
        password: 'password', password_confirmation: 'password' }
    end

  end

end
