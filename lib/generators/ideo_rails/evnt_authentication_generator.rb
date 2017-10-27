# frozen_string_literal: true

require 'rails/generators/base'
require 'ideo_rails/environments'
require 'ideo_rails/helpers'

module IdeoRails

  # EvntAuthenticationGenerator.
  class EvntAuthenticationGenerator < Rails::Generators::Base

    include IdeoRails::Helpers

    source_root File.expand_path('../../../templates/evnt_authentication', __FILE__)

    class_option 'no-migrations', type: :boolean, default: false

    desc 'This function add an authentication system with Evnt on
    your project.'
    def create_authentication
      # write messages to user
      write_messages

      # copy teplates
      manage_app_commands
      manage_app_events
      manage_app_handlers
      manage_app_models
      manage_app_controllers
      manage_app_mailers
      manage_app_views
      manage_lib
      manage_test
      manage_db_migrations unless options['no-migrations']

      # update application codes
      update_config_routes
    end

    private

    def write_messages
      print_presentation 'Authentication generator', "
      Welcome to the authentication generator.
      This generator will create all you need to manage users and their
      authentication with the system.
      Remember to activate the gems 'bcrypt' and 'jwt' on your Gemfile.
      You also need to have a VALID_EMAIL and a VALID_PASSWORD constants
      with a regex value used to validate emails and passwords.
      "
    end

    def manage_app_commands
      # copy commands
      copy_file('app/commands/authentication_commands/login_command.rb',
                'app/commands/authentication_commands/login_command.rb')
      copy_file('app/commands/authentication_commands/signup_command.rb',
                'app/commands/authentication_commands/signup_command.rb')
      copy_file('app/commands/authentication_commands/confirm_email_command.rb',
                'app/commands/authentication_commands/confirm_email_command.rb')
    end

    def manage_app_events
      # copy events
      copy_file('app/events/authentication_events/signup_event.rb',
                'app/events/authentication_events/signup_event.rb')
      copy_file('app/events/authentication_events/confirm_email_event.rb',
                'app/events/authentication_events/confirm_email_event.rb')
    end

    def manage_app_handlers
      # copy handlers
      copy_file('app/handlers/authentication_handler.rb',
                'app/handlers/authentication_handler.rb')
    end

    def manage_app_models
      # copy models
      copy_file('app/models/user.rb',
                'app/models/user.rb')
      copy_file('app/models/user_password.rb',
                'app/models/user_password.rb')
    end

    def manage_app_controllers
      # copy controllers
      copy_file('app/controllers/api/authentication_controller.rb',
                'app/controllers/api/authentication_controller.rb')
    end

    def manage_app_mailers
      # copy mailers
      copy_file('app/mailers/authentication_mailer.rb',
                'app/mailers/authentication_mailer.rb')
    end

    def manage_app_views
      # copy mail templates
      copy_file('app/views/mailers/authentication/confirm_email.html.erb',
                'app/views/mailers/authentication/confirm_email.html.erb')
      copy_file('app/views/mailers/authentication/confirm_email_completed.html.erb',
                'app/views/mailers/authentication/confirm_email_completed.html.erb')
    end

    def manage_lib
      # copy libraries
      copy_file('lib/authentication_helpers.rb',
                'lib/authentication_helpers.rb')
    end

    def manage_test
      # copy integration tests
      copy_file('test/integration/api/authentication_test.rb',
                'test/integration/api/authentication_test.rb')

      # copy commands tests
      copy_file('test/commands/authentication_commands/signup_command_test.rb',
                'test/commands/authentication_commands/signup_command_test.rb')
      copy_file('test/commands/authentication_commands/confirm_email_command_test.rb',
                'test/commands/authentication_commands/confirm_email_command_test.rb')
      copy_file('test/commands/authentication_commands/login_command_test.rb',
                'test/commands/authentication_commands/login_command_test.rb')
    end

    def manage_db_migrations
      # copy handlers
      copy_file('db/migrate/20170914232137_create_users.rb',
                'db/migrate/20170914232137_create_users.rb')
      copy_file('db/migrate/20170914232139_create_user_passwords.rb',
                'db/migrate/20170914232139_create_user_passwords.rb')
    end

    def update_config_routes
      # add login and signup on routes
      route "post 'api/authentication/login', to: 'api/authentication#login', as: 'api_authentication_login'"
      route "post 'api/authentication/signup', to: 'api/authentication#signup', as: 'api_authentication_signup'"
      route "post 'api/authentication/confirm_email', to: 'api/authentication#confirm_email', as: 'api_authentication_confirm_email'"
    end

  end

end
