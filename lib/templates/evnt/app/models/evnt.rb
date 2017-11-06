# frozen_string_literal: true

# The Evnt model is used to save all application events.
# This model should be ADD only and should not suport
# the updates and destroies operations.

# Evnt.
class Evnt < ApplicationRecord

  # Serializations:

  serialize :payload, Hash

  # Callbacks: (used to prevent update and destroy)

  before_destroy { |_record| raise ReadOnlyRecord }
  before_update { |_record| raise ReadOnlyRecord }

end
