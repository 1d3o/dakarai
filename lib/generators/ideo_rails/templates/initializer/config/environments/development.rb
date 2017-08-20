Rails.application.configure do

  # Security settings:
  ##############################################################################

  # Disable request forgery protection. [true, true, false]
  config.action_controller.allow_forgery_protection = true

  # Errors settings:
  ##############################################################################

  # Set logs level. [:debug, :error, :debug]
  config.log_level = :debug

  # Set tags for every log line. {production}
  # config.log_tags = [:request_id]

  # Use default logging formatter so that PID and timestamp are not suppressed. {production}
  # config.log_formatter = ::Logger::Formatter.new

  # Show full error reports on requests. [true, false, true]
  config.consider_all_requests_local = true

  # Print deprecation notices to the Rails logger. [:log, :notify, :stderr]
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations. [:page_load, :page_load, :page_load]
  config.active_record.migration_error = :page_load

  # Raise exceptions instead of rendering exception templates. [true, true, false]
  config.action_dispatch.show_exceptions = true

  # Raises error for missing translations. [true, false, true]
  config.action_view.raise_on_missing_translations = true

  # Database settings:
  ##############################################################################

  # Update schema after migrations. [true, false, false]
  config.active_record.dump_schema_after_migration = true

  # Cache settings:
  ##############################################################################

  # Cache classes code. [false, true, false]
  config.cache_classes = false

  # Eager load code on boot. [false, true, false]
  config.eager_load = false

  # Set cache store used for caching datas. [:memory_store, :memory_store, :memory_store]
  config.cache_store = :memory_store

  # Enable caching of controllers response. [false, true, false]
  config.action_controller.perform_caching = false

  # Enable caching of mailers response. [false, true, false]
  config.action_mailer.perform_caching = false

  # Mailer settings:
  ##############################################################################

  # Don't care if the mailer can't send. [false, false, false]
  config.action_mailer.raise_delivery_errors = false

  # Set mailer method. [:smtp, :smtp, :test]
  config.action_mailer.delivery_method = :smtp

  # Set mailer SMTP settings. {development, production}
  config.action_mailer.smtp_settings = {
    user_name: 'noreply@ideonetwork.it',
    password: 'write_here_the_password',
    domain: 'ideonetwork.it',
    address: 'smtp.ideonetwork.it',
    port: 25,
    authentication: :plain,
    enable_starttls_auto: false
  }

  # Assets settings:
  ##############################################################################

  # Enable possibility to serve files on public folder. [true, true, true]
  config.public_file_server.enabled = true

  # Compress javascript. [false, :uglifier, false]
  config.assets.js_compressor = false

  # Compress css. [false, :sass, false]
  config.assets.css_compressor = false

  # Compile assets if precompile assets are missed. [true, false, true]
  config.assets.compile = true

  # Active debug for assets. [true, false, true]
  config.assets.debug = true

  # Suppress logger output for asset requests. [false, true, false]
  config.assets.quiet = false

  # Other settings:
  ##############################################################################

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem. {development}
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

end
