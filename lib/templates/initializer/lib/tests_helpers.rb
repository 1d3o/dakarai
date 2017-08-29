# frozen_string_literal: true

# This module contains functions used to help the development of tests.
module TestsHelpers

  # This function should be used to send a request on an API.
  # It returns the response body of the request.
  def send_simple_request(method, request, headers: {}, log: false)
    return if !method || !request
    time = Benchmark.ms { send(method, request, headers: headers) }
    puts "> #{self.class.name}.#{method_name} --> #{time.round(2)} ms" if log
    JSON.parse(response.body, symbolize_names: true)
  end

end
