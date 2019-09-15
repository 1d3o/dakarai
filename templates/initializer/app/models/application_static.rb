# frozen_string_literal: true

# ApplicationStatic.
# Static models superclass. Static models should be used to manage data saved as json string
# on custom places.
class ApplicationStatic

  attr_accessor :data

  def initialize(data = nil)
    if data
      data_parsed = JSON.parse(data).with_indifferent_access
      @data = validate_data(data_parsed)
      return
    end

    @data = initialize_data
  end

  def to_string
    @data.to_json
  end

  def to_hash
    @data
  end

  protected

  # NOTE: Override this function.
  def initialize_data
    {}
  end

  # NOTE: Override this function.
  def validate_data(data)
    raise 'Data not valid' unless data&.is_a?(Hash)

    data
  end

end
