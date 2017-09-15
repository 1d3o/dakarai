# frozen_string_literal: true

require 'rails/generators/base'
require 'ideo_rails/environments'
require 'ideo_rails/helpers'

module IdeoRails

  # EvntInitializerGenerator.
  class EvntInitializerGenerator < Rails::Generators::Base

    include IdeoRails::Helpers

    source_root File.expand_path('../../../templates/evnt_initializer', __FILE__)

    class_option 'no-migrations', type: :boolean, default: false

    desc 'This function initialize your Rails project to support Evnt.'
    def create_evnt_initializer
      # write messages to user
      write_messages

      # copy templates
      manage_app_commands
      manage_app_events
      manage_app_handlers
      manage_app_models
      manage_db_migrations unless options['no-migrations']

      # update application codes
      update_config_application
    end

    private

    def write_messages
      print_presentation 'Evnt initializer generator', "
      Welcome to the Evnt initializer generator.
      This generator will create all you need to structure your
      code with the Evnt gem.
      Remember to activate the gems 'evnt' on your Gemfile.
      "
    end

    def manage_app_commands
      # copy commands
      copy_file('app/commands/application_command.rb',
                'app/commands/application_command.rb')
    end

    def manage_app_events
      # copy events
      copy_file('app/events/application_event.rb',
                'app/events/application_event.rb')
    end

    def manage_app_handlers
      # copy handlers
      copy_file('app/handlers/application_handler.rb',
                'app/handlers/application_handler.rb')
    end

    def manage_app_models
      # copy models
      copy_file('app/models/event.rb',
                'app/models/event.rb')
    end

    def manage_db_migrations
      # copy handlers
      copy_file('db/migrate/20170914231322_create_events.rb',
                'db/migrate/20170914231322_create_events.rb')
    end

    def update_config_application
      # autoload actions directory
      application "config.autoload_paths += %W[\#{Rails.root}/app/commands]"

      # autoload events directory
      application "config.autoload_paths += %W[\#{Rails.root}/app/events]"

      # autoload handlers directory
      application "config.autoload_paths += %W[\#{Rails.root}/app/handlers]"
    end

  end

end
