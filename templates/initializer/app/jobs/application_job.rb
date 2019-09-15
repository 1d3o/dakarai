# frozen_string_literal: true

# ApplicationJob.
class ApplicationJob < ActiveJob::Base

  queue_as :default

end
