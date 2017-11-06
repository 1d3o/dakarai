# frozen_string_literal: true

require 'rails/generators/base'
require 'ideo_rails/environments'
require 'ideo_rails/helpers'

module IdeoRails

  # EvntGenerator.
  class EvntGenerator < Rails::Generators::Base

    include IdeoRails::Helpers

    source_root File.expand_path('../../../templates/evnt', __FILE__)

    desc 'This function initialize your Rails project to support Evnt.'
    def create_evnt
      # write messages to user
      write_messages

      # copy templates
      manage_all

      # update application codes
      update_config_application
    end

    private

    def write_messages
      print_presentation 'Evnt generator', "
      Welcome to the Evnt generator.
      This generator will create all you need to structure your
      code with the Evnt gem.
      Remember to activate the gems 'evnt' on your Gemfile.
      "
    end

    def manage_all
      # copy commands
      directory 'app', 'app'
      directory 'db', 'db'
      directory 'test', 'test'
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
