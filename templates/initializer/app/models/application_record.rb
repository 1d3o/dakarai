# frozen_string_literal: true

# ApplicationRecord.
class ApplicationRecord < ActiveRecord::Base

  extend OrderAsSpecified

  self.abstract_class = true

end
