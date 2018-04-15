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

      # prepare engine emplate
      template 'engine_webpacker/package.json', 'package.json'
      template 'engine_webpacker/webpack.config.js', 'webpack.config.js'
      template(
        'engine_webpacker/lib/tasks/assets_management_tasks.rake',
        'lib/tasks/assets_management_tasks.rake'
      )
      copy_file 'engine_webpacker/.babelrc', '.babelrc'
      copy_file 'engine_webpacker/Gemfile', 'Gemfile'
      copy_file 'engine_webpacker/.gitignore', '.gitignore'
      copy_file(
        'engine_webpacker/app/javascript/engine/index.js',
        "app/javascript/#{@engine_name}/index.js"
      )
      copy_file(
        'engine_webpacker/app/javascript/engine/scripts/main.js',
        "app/javascript/#{@engine_name}/scripts/main.js"
      )
      copy_file(
        'engine_webpacker/app/javascript/engine/style/main.scss',
        "app/javascript/#{@engine_name}/style/main.scss"
      )
      copy_file(
        'engine_webpacker/app/views/layouts/engine/application.html.erb',
        "app/views/layouts/#{@engine_name}/application.html.erb"
      )

      # install dependencies
      system 'bundle install'
      system 'npm install -g yarn'
      system 'yarn install'
      system 'cd test/dummy && rails webpacker:install'

      # prepare engine dummy app
      template(
        'engine_webpacker/test/dummy/config/initializers/webpacker.rb',
        'test/dummy/config/initializers/webpacker.rb'
      )
      copy_file(
        'engine_webpacker/test/dummy/app/javascript/packs/application.js',
        'test/dummy/app/javascript/packs/application.js'
      )

    end

  end

end
