# frozen_string_literal: true

# AuthenticationEvents::ConfirmEmailEvent.
# Created by Ideo SRL on 02-09-2017.

module AuthenticationEvents

  # ConfirmEmailEvent.
  class ConfirmEmailEvent < ApplicationEvent

    name_is :authentication_confirm_email

    attributes_are :user_uuid, :email

    handlers_are [
      AuthenticationHandler.new
    ]

    to_write_event do
      Event.create(name: name, payload: payload)
    end

  end

end
