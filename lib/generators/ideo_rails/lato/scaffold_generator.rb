# frozen_string_literal: true

require 'rails/generators/base'

module IdeoRails
  module Lato
    # ScaffoldGenerator.
    class ScaffoldGenerator < Rails::Generators::Base

      source_root File.expand_path('../../../templates/lato', __FILE__)

      argument :model_name, type: :string, default: 'Scaffold'

      desc 'This function create a complete scaffold with Lato.'
      def create_crud
        run_model_generator
        run_lato_crud_generator
      end

      private

      def run_model_generator
        generate 'model', model_name
      end

      def run_lato_crud_generator
        generate 'ideo_rails:lato:crud', model_name
      end

    end
  end
end
