# frozen_string_literal: true

require 'rails/generators/base'

module IdeoRails
  module Lato
    # CrudGenerator.
    class CrudGenerator < Rails::Generators::Base

      source_root File.expand_path('../../../templates/lato', __FILE__)

      argument :model_name, type: :string, default: 'Crud'

      desc 'This function create a complete crud with Lato.'
      def create_crud
        set_utils_names

        run_lato_crud_controller_generator
        run_lato_crud_views_generator

        update_route
      end

      private

      def set_utils_names
        @model_name = model_name
        @singular_name = @model_name.underscore
        @plural_name = @singular_name.pluralize
        @controller_name = @plural_name.camelize
      end

      def run_lato_crud_controller_generator
        generate 'ideo_rails:lato:crud_controller', model_name
      end

      def run_lato_crud_views_generator
        generate 'ideo_rails:lato:crud_views', model_name
      end

      def update_route
        route "namespace :lato { resources :#{@plural_name} }"
      end

    end
  end
end
