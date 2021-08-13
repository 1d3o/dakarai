# ApplicationController.
class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, only: :serviceworker

  # Action used to render a custom sitemap.
  def sitemap
    render 'application/sitemap.xml.builder', formats: [:xml]
  end

  # Action used to render an updated service worker.
  # NOTE: Active extract css on webpacker.yml settings to make serviceworker works fine :)
  def serviceworker
    respond_to { |f| f.js { render action: 'serviceworker.js', layout: false } }
  end

end
