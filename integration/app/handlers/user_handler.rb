# frozen_string_literal: true

# UserHandler.
# Created by Ideo SRL on 02-09-2017.

# UserHandler.
class UserHandler < ApplicationHandler

  on :authentication_signup do
    to_update_queries do
      # update user query to save user informations
      @user = User.create(
        name: event.payload[:name], surname: event.payload[:surname],
        email: event.payload[:email]
      )
      # update user password query to save user password
      UserPassword.create(
        user_id: @user.id,
        password_digest: event.payload[:password_digest]
      )
    end

    to_manage_event do
      # send email confirmation to user
      AuthenticationMailer.confirm_email(@user).deliver_later
    end
  end

  on :authentication_confirm_email do
    to_update_queries do
      # set email confirmed to user
      event.extras[:_user].update(
        email_confirmed: true
      )
    end

    to_manage_event do
      # send email confirmation completed to user
      AuthenticationMailer.confirm_email_completed(
        event.extras[:_user]
      ).deliver_later
    end
  end

end
