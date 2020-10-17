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
    render_js 'serviceworker.js'
  end

  protected

  # Custom js sender for remote requests.
  def render_js(file_path)
    respond_to { |f| f.js { render action: file_path, layout: false } }
  end

  # Custom html sender for remote requests.
  def render_html(file_path)
    respond_to { |f| f.html { render action: file_path, layout: false } }
  end

  # Custom json sender for remote requests.
  def render_json(json_data)
    render json: json_data
  end

end
