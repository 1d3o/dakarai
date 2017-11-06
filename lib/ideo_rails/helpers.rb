# frozen_string_literal: true

module IdeoRails

  # Helpers.
  module Helpers

    def print_presentation(title, message)
      puts "\e[36m #{'*' * 25}*#{'*' * title.length}*#{'*' * 25} \e[0m\n"
      puts "\e[36m #{'*' * 25} #{title} #{'*' * 25} \e[0m\n"
      puts "\e[36m #{'*' * 25}*#{'*' * title.length}*#{'*' * 25} \e[0m\n"
      puts ''
      puts "\e[36m #{message} \e[0m\n"
      puts ''
      puts "\e[36m #{'*' * 25}*#{'*' * title.length}*#{'*' * 25} \e[0m\n"
    end

  end

end
