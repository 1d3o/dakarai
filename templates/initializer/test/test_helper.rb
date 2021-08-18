ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # This function should be used to send a request on an API.
  # It returns the response body of the request.
  # TODO: Show example of usage
  def send_simple_request(method, request, headers: {}, log: false)
    return if !method || !request

    if log
      time = Benchmark.ms { send(method, request, headers: headers) }
      puts "> #{self.class.name}.#{method_name} --> #{time.round(2)} ms"
    else
      send(method, request, headers: headers)
    end

    ::JSON.parse(response.body, symbolize_names: true)
  end

end

