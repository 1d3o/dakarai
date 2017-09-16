# frozen_string_literal: true

# Api::AuthenticationTest.
# Created by Ideo SRL on 02-09-2017.

require 'test_helper'

module Api

  # AuthenticationTest.
  class AuthenticationTest < ActionDispatch::IntegrationTest

    include AuthenticationHelpers

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

    test 'User can request a confirmation email' do
      send_simple_request(
        :post,
        api_authentication_confirm_email_path(confirm_email_params)
      )

      # check response
      assert_response :success
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

    def confirm_email_params
      { token: 'examplestring' }
    end

    # Generators:
    ############################################################################

    def generate_login_data
      data = { email: Faker::Internet.email, password: 'Password1'}

      user = User.create(
        uuid: SecureRandom.uuid, name: Faker::Name.first_name,
        surname: Faker::Name.last_name, email: data[:email]
      )
      UserPassword.create(
        user_uuid: user.uuid,
        password_digest: BCrypt::Password.create(data[:password])
      )

      data
    end

  end

end
