# frozen_string_literal: true

# TODO: Manage the model name in a dynamic way.

require 'rails/generators/base'
require 'ideo_rails/environments'
require 'ideo_rails/helpers'

module IdeoRails

  # AuthenticationGenerator.
  class AuthenticationGenerator < Rails::Generators::Base

    include IdeoRails::Helpers

    source_root File.expand_path('../../../templates/authentication', __FILE__)

    argument :model_name, type: :string, default: 'Queries::User'

    desc 'This function add an authentication system with Evnt on
    your project.'
    def create_authentication
      @names = model_to_names(model_name)

      # write messages to user
      write_messages

      # copy teplates
      manage_app_commands
      manage_app_events
      manage_app_handlers
      manage_app_controllers
      manage_lib
      manage_test

      # update application codes
      update_config_routes

      # create required models
      run_models_generator
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
      copy_file('app/commands/authentication/login_command.rb',
                'app/commands/authentication/login_command.rb')
      copy_file('app/commands/authentication/signup_command.rb',
                'app/commands/authentication/signup_command.rb')
    end

    def manage_app_events
      # copy events
      copy_file('app/events/authentication/signup_event.rb',
                'app/events/authentication/signup_event.rb')
    end

    def manage_app_handlers
      # copy handlers
      copy_file('app/handlers/user_handler.rb',
                'app/handlers/user_handler.rb')
    end

    def manage_app_controllers
      # copy controllers
      copy_file('app/controllers/api/authentication_controller.rb',
                'app/controllers/api/authentication_controller.rb')
    end

    def manage_lib
      # copy libraries
      copy_file('lib/authentication_controllers_helpers.rb',
                'lib/authentication_controllers_helpers.rb')
    end

    def manage_test
      # copy integration tests
      copy_file('test/integration/api/authentication_test.rb',
                'test/integration/api/authentication_test.rb')

      # copy commands tests
      copy_file('test/commands/authentication/signup_command_test.rb',
                'test/commands/authentication/signup_command_test.rb')
    end

    def update_config_routes
      # add login and signup on routes
      route "post 'api/authentication/login', to: 'api/authentication#login', as: 'api_authentication_login'"
      route "post 'api/authentication/signup', to: 'api/authentication#signup', as: 'api_authentication_signup'"
    end

    def run_models_generator
      # generate entity model
      generate 'model', "#{@names[:model]} uuid:string name:string surname:string email:string"

      # generate entity passwords model
      generate 'model', "#{@names[:model]}Password user_uuid:string password_digest:string"
    end

  end

end
