# frozen_string_literal: true

require 'rails/generators/base'

module IdeoRails
  module Lato
    # CrudViewsGenerator.
    class CrudViewsGenerator < Rails::Generators::Base

      source_root File.expand_path('../../../../templates/lato/crud_view', __FILE__)

      argument :model_name, type: :string, default: 'Crud'

      desc 'This function create a complete crud controller with Lato.'
      def create_crud
        set_utils_names

        manage_views
        manage_shared_views
      end

      private

      def set_utils_names
        @model_name = model_name
        @singular_name = @model_name.underscore
        @plural_name = @singular_name.pluralize
        @controller_name = @plural_name.camelize
      end

      def manage_views
        # copy index
        template('app/views/lato/crud/index.html.erb',
                 "app/views/lato/#{@plural_name}/index.html.erb")
        # copy show
        template('app/views/lato/crud/show.html.erb',
                 "app/views/lato/#{@plural_name}/show.html.erb")
        # copy new
        template('app/views/lato/crud/new.html.erb',
                 "app/views/lato/#{@plural_name}/new.html.erb")
        # copy edit
        template('app/views/lato/crud/edit.html.erb',
                 "app/views/lato/#{@plural_name}/edit.html.erb")
      end

      def manage_shared_views
        # copy form
        template('app/views/lato/crud/shared/_form.html.erb',
                 "app/views/lato/#{@plural_name}/shared/_form.html.erb")
      end

    end
  end
end
