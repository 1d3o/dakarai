# frozen_string_literal: true

# ApplicationJob.
class ApplicationJob < ActiveJob::Base

  queue_as :default

  protected

  # Custom logger for errors.
  def job_errors_logger
    @job_errors_logger ||= Logger.new("#{Rails.root}/log/custom/job_errors.log")
  end

end
