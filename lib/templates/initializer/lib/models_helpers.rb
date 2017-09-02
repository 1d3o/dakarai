# frozen_string_literal: true

# ModelsHelpers.
# Updated by Gregorio Galante on 02-09-2017.

# ModelsHelpers.
module ModelsHelpers

  # This function initialize a list of observers for a model.
  def initialize_observers
    @observers = []
  end

  # This function send a notification to all observers for the model.
  def notify_observers(event, args: nil)
    @observers.each do |observer|
      observer.notify(event, args)
    end
  end

  # This function add a new observer on the list of model observers.
  def add_observer(observer)
    @observers << observer
  end

  # This function delete an observer from the list of possible observers.
  def delete_observer(observer)
    @observers.delete(observer)
  end

end
