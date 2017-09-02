# frozen_string_literal: true

require 'test_helper'

module Api

  # AuthenticationControllerTest.
  class AuthenticationControllerTest < ActionDispatch::IntegrationTest

    def test_signup
      response = send_simple_request(
        :post,
        api_authentication_signup_path(signup_params)
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

      # check response succeeded
      assert_equal true, response[:result]

      # check response contain a token
      assert_not_nil response[:payload][:token]
    end

    private

    # Params:
    # ##########################################################################

    def signup_params
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
