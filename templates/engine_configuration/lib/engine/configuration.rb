# frozen_string_literal: true

# <%= @engine_class %>.
module <%= @engine_class %>

  class << self; attr_accessor :configuration; end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  # Configuration.
  class Configuration

    attr_accessor :option1

    def initialize
      @option1 = 'value'
    end

  end

end
