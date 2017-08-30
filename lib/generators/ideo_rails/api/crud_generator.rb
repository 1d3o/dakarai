# frozen_string_literal: true

require 'rails/generators/base'

module IdeoRails
  module Api
    # CrudGenerator.
    class CrudGenerator < Rails::Generators::Base

      source_root File.expand_path('../../../templates/api/crud', __FILE__)

      argument :model_name, type: :string, default: 'Crud'

      desc 'This function create a complete crud with Lato.'
      def create_crud
        set_utils_names
        # TODO: Continue
        update_route
      end

      private

      def set_utils_names
        @model_name = model_name
        @singular_name = @model_name.underscore
        @plural_name = @singular_name.pluralize
        @controller_name = @plural_name.camelize
      end

      def update_route
        route "namespace :api { resources :#{@plural_name} }"
      end

    end
  end
end
