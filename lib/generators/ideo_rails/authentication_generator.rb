# frozen_string_literal: true

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
      manage_commands
      manage_events
      manage_handlers
      manage_controllers
      manage_libraries
      manage_test

      # update application codes
      update_routes

      # create required models
      run_models_generator
    end

    private

    def write_messages
      print_presentation 'Authentication generator', "
      Welcome to the authentication generator.
      This generator will create all you need to manage user and their
      authentication with the system.
      Remember to activate the gems 'bcrypt' and 'jwt' on your Gemfile.
      "
    end

    def manage_commands
      # copy commands
      copy_file('app/commands/authentication/login_command.rb',
                'app/commands/authentication/login_command.rb')
      copy_file('app/commands/authentication/signup_command.rb',
                'app/commands/authentication/signup_command.rb')
    end

    def manage_events
      # copy events
      copy_file('app/events/authentication/signup_event.rb',
                'app/events/authentication/signup_event.rb')
    end

    def manage_handlers
      # copy handlers
      copy_file('app/handlers/user_handler.rb',
                'app/handlers/user_handler.rb')
    end

    def manage_controllers
      # copy controllers
      copy_file('app/controllers/api/authentication_controller.rb',
                'app/controllers/api/authentication_controller.rb')
    end

    def manage_libraries
      # copy libraries
      copy_file('lib/authentication_controllers_helpers.rb',
                'lib/authentication_controllers_helpers.rb')
    end

    def manage_test
      # copy controllers tests
      # TODO
    end

    def update_routes
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
