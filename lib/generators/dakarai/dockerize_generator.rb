require 'rails/generators/base'

module Dakarai

  # DockerizeGenerator.
  # Make your applcation working with Docker.
  class DockerizeGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../templates', __FILE__)

    def create_dockerize
      directory './dockerize', './'
    end

  end

end
