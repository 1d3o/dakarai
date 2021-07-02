# Define some util regex for application.

REGEX_VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

REGEX_VALID_PASSWORD = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,}$/.freeze

REGEX_VALID_USERNAME = /\A[a-z0-9_]{4,16}\z/.freeze

REGEX_VALID_IMAGE_MIME_TYPE = %r{/\Aimage\/.*\z/}.freeze
