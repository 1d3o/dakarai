# frozen_string_literal: true

require 'rails/generators/base'

module IdeoRails
  module Lato
    # CrudControllerGenerator.
    class CrudControllerGenerator < Rails::Generators::Base

      source_root File.expand_path('../../../../templates/lato/crud_controller', __FILE__)

      argument :model_name, type: :string, default: 'Crud'

      desc 'This function create a complete crud controller with Lato.'
      def create_crud
        set_utils_names

        manage_controller
      end

      private

      def set_utils_names
        @model_name = model_name
        @singular_name = @model_name.underscore
        @plural_name = @singular_name.pluralize
        @controller_name = @plural_name.camelize
      end

      def manage_controller
        template('app/controllers/lato/crud_controller.rb',
                 "app/controllers/lato/#{@plural_name}_controller.rb")
      end

    end
  end
end
