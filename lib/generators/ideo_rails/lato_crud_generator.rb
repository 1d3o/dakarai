# frozen_string_literal: true

require 'rails/generators/base'

module IdeoRails
  # LatoCrudGenerator.
  class LatoCrudGenerator < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    desc 'This function initialize your Rails project with files to manage a CRUD from Lato.'
    def create_initializer_file
      # copy controller
      template(
        'lato_crud/app/controllers/lato/crud_controller.rb',
        'app/controllers/lato/crud_controller.rb'
      )
      # copy views
      template(
        'lato_crud/app/views/lato/crud/index.html.erb',
        'app/views/lato/crud/index.html.erb'
      )
      template(
        'lato_crud/app/views/lato/crud/new.html.erb',
        'app/views/lato/crud/new.html.erb'
      )
      template(
        'lato_crud/app/views/lato/crud/show.html.erb',
        'app/views/lato/crud/show.html.erb'
      )
      template(
        'lato_crud/app/views/lato/crud/edit.html.erb',
        'app/views/lato/crud/edit.html.erb'
      )
      template(
        'lato_crud/app/views/lato/crud/shared/_form.html.erb',
        'app/views/lato/crud/shared/_form.html.erb'
      )
    end

  end
end
