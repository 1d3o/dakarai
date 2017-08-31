# frozen_string_literal: true

require 'rails/generators/base'

module IdeoRails

  # AuthenticationGenerator.
  class AuthenticationGenerator < Rails::Generators::Base

    include IdeoRails::Helpers

    source_root File.expand_path('../../../templates/evnt/authentication', __FILE__)

    argument :model_name, type: :string, default: 'Queries::User'

    desc 'This function add an authentication system with Evnt on
    your project.'
    def create_authentication
      @names = model_to_names(model_name)

      # create required models
      run_models_generator
    end

    private

    def run_models_generator
      # generate entity model
      generate 'model', "#{@names[:model]} uuid:string name:string
      surname:string email:string"

      # generate entity passwords model
      generate 'model', "#{@names[:model]}Password uuid:string
      password_digest:string"
    end

  end

end
