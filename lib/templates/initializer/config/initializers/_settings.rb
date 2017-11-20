# frozen_string_literal: true

# Initializer for system settings file.

APPLICATION_VERSION = '1.0'

# Update default classes settings:

# language
I18n.enforce_available_locales = false
I18n.default_locale = :en

# date and time format
Date::DATE_FORMATS[:default] = '%d/%m/%Y'
Time::DATE_FORMATS[:default] = '%d/%m/%Y %H:%M'

# Set global regex values:

VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

VALID_IMAGE = %r{/\Aimage\/.*\z/}

VALID_PASSWORD = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,20}$/

VALID_USERNAME = /\A[a-z0-9_]{4,16}\z/

# Set global settings:

CUSTOM_SETTINGS = {}.freeze
