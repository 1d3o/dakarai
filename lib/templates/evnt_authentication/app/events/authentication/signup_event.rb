# frozen_string_literal: true

# Authentication::SignupEvent.
# Created by Ideo SRL on 02-09-2017.

module Authentication

  # SignupEvent.
  class SignupEvent < ApplicationEvent

    name_is :authentication_signup

    attributes_are :name, :surname, :email, :password_digest

    handlers_are [
      UserHandler.new
    ]

    to_write_event do
      Event.create(name: name, payload: payload)
    end

  end

end
