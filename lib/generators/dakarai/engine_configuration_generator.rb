# frozen_string_literal: true

require 'rails/generators/base'

module Dakarai

  # EngineConfigurationGenerator.
  class EngineConfigurationGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../templates', __FILE__)

    argument :engine, type: :string, optional: false

    def create_engine_configuration
      @engine_class = engine.camelize
      @engine_name = engine.underscore

      template(
        'engine_configuration/lib/engine/configuration.rb',
        "lib/#{@engine_name}/configuration.rb"
      )
    end

  end

end
