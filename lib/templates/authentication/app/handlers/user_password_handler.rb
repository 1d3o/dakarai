# frozen_string_literal: true

# UserPasswordHandler.
class UserPasswordHandler

  on :authentication_signup do
    to_update_queries do
      # update user query to save user informations
      Queries::UserPassword.create(
        user_uuid: event.payload[:uuid],
        password_digest: event.payload[:password_digest]
      )
    end
  end

end
