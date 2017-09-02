# frozen_string_literal: true

# Api::AuthenticationTest.
# Updated by Gregorio Galante on 02-09-2017.

require 'test_helper'

module Api

  # AuthenticationTest.
  class AuthenticationTest < ActionDispatch::IntegrationTest

    test 'User can do signup to the system and should receive a token' do
      response = send_simple_request(
        :post,
        api_authentication_signup_path(signup_params)
      )

      # check response
      assert_response :success
      assert response[:result]

      # check response contain a token
      assert_not_nil response[:payload][:token]
    end

    test 'User can do login to the system and should receive a token' do
      response = send_simple_request(
        :post,
        api_authentication_login_path(login_params)
      )

      # check response
      assert_response :success
      assert response[:result]

      # check response contain a token
      assert_not_nil response[:payload][:token]
    end

    private

    # Params:
    ############################################################################

    def signup_params
      { name: Faker::Name.first_name, surname: Faker::Name.last_name,
        email: Faker::Internet.email, password: 'Password1',
        password_confirmation: 'Password1' }
    end

    def login_params
      login_data = generate_login_data
      { email: login_data[:email], password: login_data[:password] }
    end

    # Generators:
    ############################################################################

    def generate_login_data
      data = { email: Faker::Internet.email, password: 'Password1',
               uuid: SecureRandom.uuid }

      Queries::User.create(
        name: Faker::Name.first_name, surname: Faker::Name.last_name,
        uuid: data[:uuid], email: data[:email]
      )
      Queries::UserPassword.create(
        user_uuid: data[:uuid],
        password_digest: BCrypt::Password.create(data[:password])
      )

      data
    end

  end

end
