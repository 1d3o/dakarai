# frozen_string_literal: true

# UserHandler.
class UserHandler

  on :authentication_signup do
    to_update_queries do
      # update user query to save user informations
      Queries::User.create(
        uuid: event.payload[:uuid], name: event.payload[:name],
        surname: event.payload[:surname], email: event.payload[:email]
      )
    end
  end

end
