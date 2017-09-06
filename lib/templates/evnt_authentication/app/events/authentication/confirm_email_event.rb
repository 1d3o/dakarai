# frozen_string_literal: true

# Authentication::ConfirmEmailEvent.
# Created by Ideo SRL on 02-09-2017.

module Authentication

  # ConfirmEmailEvent.
  class ConfirmEmailEvent < ApplicationEvent

    name_is :authentication_confirm_email

    attributes_are :user_id, :email

    handlers_are [
      UserHandler.new
    ]

    to_write_event do
      Event.create(name: name, payload: payload)
    end

  end

end
