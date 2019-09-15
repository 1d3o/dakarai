# frozen_string_literal: true

require 'rails/generators/base'

module Dakarai

  # InitializerGenerator.
  # Copy the base files structure to the Rails project.
  class InitializerGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../templates', __FILE__)

    def create_initializer
      directory './initializer', './'
    end

  end

end
