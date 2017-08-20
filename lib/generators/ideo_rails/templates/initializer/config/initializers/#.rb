# frozen_string_literal: true

# Initializer for system settings file.

# Require custom files:

Dir[File.join(Rails.root, 'lib', '**/*.rb')].each do |f|
  require f
end

# Update default classes settings:

# language
I18n.enforce_available_locales = false
I18n.default_locale = :en

# date and time format
Date::DATE_FORMATS[:default] = '%d/%m/%Y'
Time::DATE_FORMATS[:default] = '%d/%m/%Y %H:%M'

# Set global helpers values:

VALID_EMAIL = %r{/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}

VALID_IMAGE = %r{/\Aimage\/.*\z/}

# Set global settings:

SETTINGS = {}.freeze
