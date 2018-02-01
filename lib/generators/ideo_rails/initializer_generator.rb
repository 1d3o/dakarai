# frozen_string_literal: true

require 'rails/generators/base'

module IdeoRails

  # InitializerGenerator.
  class InitializerGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../templates', __FILE__)

    def create_initializer
      directory './initializer', './'
    end

  end

end
