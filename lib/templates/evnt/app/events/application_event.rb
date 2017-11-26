# frozen_string_literal: true

class ApplicationEvent < Evnt::Event

  to_write_event do
    EvntEvent.create(name: name, payload: payload)
  end

end
