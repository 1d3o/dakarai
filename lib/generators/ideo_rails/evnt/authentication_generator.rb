# frozen_string_literal: true

require 'rails/generators/base'

module IdeoRails

  module Evnt

    # AuthenticationGenerator.
    class AuthenticationGenerator < Rails::Generators::Base

      source_root File.expand_path('../../../../templates/evnt/authentication', __FILE__)

      desc 'This function add an authentication system with Evnt on your project.'
      def create_authentication; end

    end

  end

end
