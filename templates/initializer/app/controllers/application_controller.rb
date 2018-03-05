# frozen_string_literal: true

# ApplicationController.
class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  protected

  # Custom logger for errors.
  def controller_errors_logger
    @controller_errors_logger ||= Logger.new("#{Rails.root}/log/custom/controller_errors.log")
  end

end
