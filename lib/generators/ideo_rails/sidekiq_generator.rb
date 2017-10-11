# frozen_string_literal: true

require 'rails/generators/base'
require 'ideo_rails/environments'
require 'ideo_rails/helpers'

module IdeoRails

  # SidekiqGenerator.
  class SidekiqGenerator < Rails::Generators::Base

    include IdeoRails::Helpers

    source_root File.expand_path('../../../templates/sidekiq', __FILE__)

    desc 'This function initialize your Rails project to support Sidekiq for jobs.'
    def create_evnt_initializer
      # write messages to user
      write_messages

      # copy templates
      manage_config 
    end

    private

    def write_messages
      print_presentation 'Sidekiq generator', "
      Welcome to the Sidekiq generator.
      This generator will create all you need to manage your jobs
      with sidekiq.
      Remember to activate the gems 'sidekiq', 'sidekiq-cron'
      and 'redis' on your Gemfile and to change the active
      job queue adapter on the environment settings.
      "
    end

    def manage_config
      copy_file('config/sidekiq.yml', 'config/sidekiq.yml')
      copy_file('config/sidekiq_schedule.yml', 'config/sidekiq_schedule.yml')
      copy_file('config/initializers/sidekiq.rb', 'config/initializers/sidekiq.rb')
    end

  end

end
