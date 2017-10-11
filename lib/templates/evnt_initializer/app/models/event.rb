# frozen_string_literal: true

# Event.
# Created by Ideo SRL on 15-09-2017.

# The Event model is used to save all application events.
# This model should be ADD only and should not suport
# the updates and destroies operations.

# Event.
class Event < ApplicationRecord

  # Serializations:

  serialize :payload, Hash

  # Callbacks: (used to prevent update and destroy)

  before_destroy { |_record| raise ReadOnlyRecord }
  before_update { |_record| raise ReadOnlyRecord }

end
