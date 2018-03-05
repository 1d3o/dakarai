# frozen_string_literal: true

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module ActiveSupport

  # TestCase.
  class TestCase

    protected
    
    # This function should be used to send a request on an API.
    # It returns the response body of the request.
    def send_simple_request(method, request, headers: {}, log: false)
      return if !method || !request

      if log
        time = Benchmark.ms { send(method, request, headers: headers) }
        puts "> #{self.class.name}.#{method_name} --> #{time.round(2)} ms"
      else
        send(method, request, headers: headers)
      end

      JSON.parse(response.body, symbolize_names: true)
    end

  end

end
