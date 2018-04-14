# frozen_string_literal: true

require 'rails/generators/base'

module Dakarai

  # EngineWebpackerGenerator.
  class EngineWebpackerGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../templates', __FILE__)

    argument :engine, type: :string, optional: false

    def create_engine_webpacker
      @engine_class = engine.camelize
      @engine_name = engine.underscore

      template 'engine_webpacker/package.json', 'package.json'
      template 'engine_webpacker/webpack.config.js', 'webpack.config.js'
      template(
        'engine_webpacker/lib/tasks/assets_management_tasks.rake',
        'lib/tasks/assets_management_tasks.rake'
      )
      template(
        'engine_webpacker/test/dummy/package.json',
        'test/dummy/package.json'
      )

      copy_file 'engine_webpacker/.babelrc', '.babelrc'
      copy_file(
        'engine_webpacker/app/javascript/engine/index.js',
        "app/javascript/#{@engine_name}/index.js"
      )
    end

  end

end
