# frozen_string_literal: true

require 'rails/generators/base'
require 'ideo_rails/environments'
require 'ideo_rails/helpers'

module IdeoRails

  # InitializerGenerator.
  class InitializerGenerator < Rails::Generators::Base

    include IdeoRails::Environments
    include IdeoRails::Helpers

    source_root File.expand_path('../../../templates/initializer', __FILE__)

    argument :application_name, type: :string, default: 'MyApplication'

    class_option 'dev', type: :boolean, default: false

    desc 'This function initialize your Rails project with initial
    required files.'
    def create_initializer
      # write messages to user
      write_messages

      # copy templates
      manage_gemfile
      manage_rubocop
      manage_config_environments
      manage_config_initializers
      manage_lib
      manage_changelog
      manage_app_views
      manage_app_assets
      manage_app_controllers
      manage_test
      manage_public

      # update application codes
      update_config_application
    end

    private

    def write_messages
      print_presentation 'Initializer generator', "
      Welcome to the Initializer generator.
      This generator will create all you need to start to develop
      your Ruby on Rails project.
      We need to override some default files, please say yes to
      all override requests.
      "
    end

    def manage_gemfile
      # copy Gemfile
      copy_file('Gemfile', 'Gemfile')

      # add local gem if env is development
      gem 'ideo_rails', path: '../' if options['dev']
    end

    def manage_rubocop
      # copy rubocop settings
      copy_file('.rubocop.yml', '.rubocop.yml')
    end

    def manage_config_environments
      # copy environment test
      @environment_settings = DEFAULT_ENVIRONMENT_TEST_SETTINGS
      template('config/environments/environment.rb',
               'config/environments/test.rb')

      # copy environment development
      @environment_settings = DEFAULT_ENVIRONMENT_DEVELOPMENT_SETTINGS
      template('config/environments/environment.rb',
               'config/environments/development.rb')

      # copy environment production
      @environment_settings = DEFAULT_ENVIRONMENT_PRODUCTION_SETTINGS
      template('config/environments/environment.rb',
               'config/environments/production.rb')
    end

    def manage_config_initializers
      # copy config initializers
      copy_file('config/initializers/_settings.rb',
                'config/initializers/_settings.rb')
    end

    def manage_lib
      # copy lib helpers
      copy_file('lib/api_controllers_helpers.rb',
                'lib/api_controllers_helpers.rb')
      copy_file('lib/models_helpers.rb',
                'lib/models_helpers.rb')
      copy_file('lib/tests_helpers.rb',
                'lib/tests_helpers.rb')
    end

    def manage_changelog
      # copy changelog
      copy_file('changelog/version_1.0',
                'changelog/version_1.0')
    end

    def manage_app_views
      # copy layout
      template('app/views/layouts/application.html.erb',
               'app/views/layouts/application.html.erb')
    end

    def manage_app_assets
      # copy application js
      copy_file('app/assets/javascripts/application.js',
                'app/assets/javascripts/application.js')
    end

    def manage_app_controllers
      # copy api application controller
      copy_file('app/controllers/api/application_controller.rb',
                'app/controllers/api/application_controller.rb')
    end

    def manage_test
      # copy tests helpers
      copy_file('test/test_helper.rb', 'test/test_helper.rb')
    end

    def manage_public
      # copy default error pages
      copy_file('public/404.html', 'public/404.html')
      copy_file('public/422.html', 'public/422.html')
      copy_file('public/500.html', 'public/500.html')
    end

    def update_config_application
      # autoload lib path
      application "config.autoload_paths += %W[\#{Rails.root}/lib]"
    end

  end

end
