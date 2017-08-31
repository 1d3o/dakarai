# frozen_string_literal: true

require 'rails/generators/base'

module IdeoRails
  module Evnt
    # InitializerGenerator.
    class InitializerGenerator < Rails::Generators::Base

      source_root File.expand_path('../../../../templates/evnt/initializer', __FILE__)

      desc 'This function initialize your Rails project to support Evnt.'
      def create_initializer
        manage_commands
        manage_events
        manage_handlers

        update_application
      end

      private

      def manage_commands
        # copy commands
        copy_file('commands/application_command.rb',
                  'app/commands/application_command.rb')
      end

      def manage_events
        # copy events
        copy_file('events/application_event.rb',
                  'app/events/application_event.rb')
      end

      def manage_handlers
        # copy handlers
        copy_file('handlers/application_handler.rb',
                  'app/handlers/application_handler.rb')
      end

      def update_application
        # autoload actions directory
        application "config.autoload_paths += %W[\#{Rails.root}/app/commands]"
        # autoload events directory
        application "config.autoload_paths += %W[\#{Rails.root}/app/events]"
        # autoload handlers directory
        application "config.autoload_paths += %W[\#{Rails.root}/app/handlers]"
      end

    end
  end
end
