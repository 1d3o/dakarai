# frozen_string_literal: true

require 'rails/generators/base'

module IdeoRails
  # InitializerGenerator.
  class InitializerGenerator < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    desc 'This function initialize your Rails project with initial
    required files.'
    def create_initializer_file
      # copy Gemfile
      template('initializer/Gemfile', 'Gemfile')
      # copy .rubocop
      template('initializer/.rubocop.yml', '.rubocop.yml')
      # copy config environments
      template(
        'initializer/config/environments/test.rb',
        'config/environments/test.rb'
      )
      template(
        'initializer/config/environments/development.rb',
        'config/environments/development.rb'
      )
      template(
        'initializer/config/environments/production.rb',
        'config/environments/production.rb'
      )
      # copy config initializers
      template(
        'initializer/config/initializers/#.rb',
        'config/initializers/#.rb'
      )
      # copy lib helpers
      template(
        'initializer/lib/apis_helpers.rb',
        'lib/apis_helpers.rb'
      )
      template(
        'initializer/lib/models_helpers.rb',
        'lib/models_helpers.rb'
      )
      template(
        'initializer/lib/tests_helpers.rb',
        'lib/tests_helpers.rb'
      )
      # copy changelog
      template(
        'initializer/changelog/version_1.0',
        'changelog/version_1.0'
      )
    end

  end
end
