# frozen_string_literal: true

require 'rails/generators/base'

module Dakarai

  # SidekiqGenerator.
  class SidekiqGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../templates', __FILE__)

    def create_sidekiq
      directory './sidekiq', './'
    end

  end

end
