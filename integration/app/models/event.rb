# frozen_string_literal: true

# Event.
# Created by Ideo SRL on 15-09-2017.

# Event.
class Event < ApplicationRecord

  # Settings:

  serialize :payload, Hash

end
