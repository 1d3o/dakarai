# frozen_string_literal: true

# UserHandler.
class UserHandler < ApplicationHandler

  on :authentication_signup do
    to_update_queries do
      # update user query to save user informations
      Queries::User.create(
        uuid: event.payload[:uuid], name: event.payload[:name],
        surname: event.payload[:surname], email: event.payload[:email]
      )
      # update user password query to save user password
      Queries::UserPassword.create(
        user_uuid: event.payload[:uuid],
        password_digest: event.payload[:password_digest]
      )
    end
  end

end
