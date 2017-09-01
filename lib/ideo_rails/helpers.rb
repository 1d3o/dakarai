# frozen_string_literal: true

module IdeoRails

  # Helpers.
  module Helpers

    def model_to_names(model)
      {
        model: model,
        controller: model.pluralize,
        singular: model.underscore,
        plural: model.underscore.pluralize,
        human: model.humanize
      }
    end

    def print_important(message)
      puts "\e[31m --> IMPORTANT: #{message} \e[0m\n"
    end

  end

end
