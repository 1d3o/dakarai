# frozen_string_literal: true

# Event.
# Created by Ideo SRL on 15-09-2017.

# Event.
class Event < ApplicationRecord

  # Serializations:

  serialize :payload, Hash

  # Callbacks: (used to prevent update and destroy)

  before_destroy { |_record| raise ReadOnlyRecord }
  before_update { |_record| raise ReadOnlyRecord }

end
