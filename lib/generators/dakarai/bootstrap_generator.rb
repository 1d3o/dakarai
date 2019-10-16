# frozen_string_literal: true

require 'rails/generators/base'

module Dakarai

  # BootstrapGenerator.
  # Bootstrap integration to your application.
  class BootstrapGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../templates', __FILE__)

    def create_bootstrap
      directory './bootstrap', './'
      run 'yarn add bootstrap jquery popper.js'
    end

  end

end
