Rails.application.configure do

  # Rails settings:
  ############################################################################

  # Set logs level.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Show full error reports on requests.
  config.consider_all_requests_local = false

  # Set exception type format. [:default, :api]
  config.debug_exception_response_format = :default

  # Cache classes code.
  config.cache_classes = true

  # Eager load code on boot.
  config.eager_load = true

  # Set cache store used for caching datas. [:redis_store]
  config.cache_store = :memory_store

  # Use server only for api.
  config.api_only = false

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = false

  # Use master key for security.
  config.require_master_key = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem. {development}
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # ActiveSupport settings:
  ############################################################################
  # Active Support is a collection of utility classes and standard library
  # extensions that were found useful for the Rails framework.

  # Print deprecation notices to the Rails logger. [:log, :notify, :stderr]
  config.active_support.deprecation = :notify

  # ActiveRecord settings:
  ############################################################################
  # Active Record is the M in MVC - the model - which is the layer of the
  # system responsible for representing business data and logic.

  # Raise an error on page load if there are pending migrations. [:page_load]
  config.active_record.migration_error = :page_load

  # Update schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # ActiveJob settings:
  ############################################################################

  # Set queue adapter to run jobs:
  config.active_job.queue_adapter = :async

  # ActionDispatch settings:
  ############################################################################

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = true

  # ActionController settings:
  ############################################################################

  # Disable request forgery protection.
  config.action_controller.allow_forgery_protection = true

  # Enable caching of controllers response.
  config.action_controller.perform_caching = true

  # Set controller url host.
  config.action_controller.default_url_options = { host: 'http://localhost:3000' }

  # ActionView settings:
  ############################################################################

  # Raises error for missing translations.
  config.action_view.raise_on_missing_translations = false

  # ActionMailer settings:
  ############################################################################

  # Enable caching of mailers response.
  config.action_mailer.perform_caching = false

  # Raise errors for delivery problems
  config.action_mailer.raise_delivery_errors = false

  # Set mailer method. [:smtp, :test]
  config.action_mailer.delivery_method = :smtp

  # Set mailer queue for delivery later.
  config.action_mailer.deliver_later_queue_name = 'mailer'

  # Set mailer SMTP settings.
  # config.action_mailer.smtp_settings = {
  #   user_name: 'noreply@domain.it',
  #   password: 'write_here_the_password',
  #   domain: 'domain.it',
  #   address: 'smtp.domain.it',
  #   port: 25,
  #   authentication: :plain,
  #   enable_starttls_auto: false
  # }

  # Set mailer url host.
  config.action_mailer.default_url_options = { host: 'http://localhost:3000' }

  # Active storage settings:
  ############################################################################

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Public file server settings:
  ############################################################################

  # Enable possibility to serve files on public folder.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Enable cache lifetime (use with action_controller.perform_caching true).
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{2.days.to_i}"
  }

end
