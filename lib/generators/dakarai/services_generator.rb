# frozen_string_literal: true

require 'rails/generators/base'

module Dakarai

  # ServicesGenerator.
  class ServicesGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../templates', __FILE__)

    def create_services
      directory './services', './services'
      application "config.autoload_paths += %W[\#{Rails.root}/app/services]"
    end

  end

end
