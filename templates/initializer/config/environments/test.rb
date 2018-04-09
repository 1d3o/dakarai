# frozen_string_literal: true

Rails.application.configure do

  # Rails settings:
  ############################################################################

  # Set logs level.
  config.log_level = :debug

  # Show full error reports on requests. [true, false]
  config.consider_all_requests_local = true

  # Set exception type format. [:default, :api]
  config.debug_exception_response_format = :default

  # Cache classes code. [true, false]
  config.cache_classes = false

  # Eager load code on boot. [true, false]
  config.eager_load = false

  # Set cache store used for caching datas. [:memory_store]
  config.cache_store = :memory_store

  # Use server only for api. [true, false]
  config.api_only = false

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = false

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem. {development}
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # ActiveSupport settings:
  ############################################################################
  # Active Support is a collection of utility classes and standard library
  # extensions that were found useful for the Rails framework.

  # Print deprecation notices to the Rails logger. [:log, :notify, :stderr]
  config.active_support.deprecation = :stderr

  # ActiveRecord settings:
  ############################################################################
  # Active Record is the M in MVC - the model - which is the layer of the
  # system responsible for representing business data and logic.

  # Raise an error on page load if there are pending migrations. [:page_load]
  config.active_record.migration_error = :page_load

  # Update schema after migrations. [true, false]
  config.active_record.dump_schema_after_migration = false

  # ActiveJob settings:
  ############################################################################

  # Set queue adapter to run jobs:
  config.active_job.queue_adapter = :inline

  # ActionDispatch settings:
  ############################################################################
  
  # Raise exceptions instead of rendering exception templates. [true, false]
  config.action_dispatch.show_exceptions = false

  # ActionController settings:
  ############################################################################

  # Disable request forgery protection. [true, false]
  config.action_controller.allow_forgery_protection = false

  # Enable caching of controllers response. [true, false]
  config.action_controller.perform_caching = false

  # ActionView settings:
  ############################################################################

  # Raises error for missing translations. [true, false]
  config.action_view.raise_on_missing_translations = true

  # ActionMailer settings:
  ############################################################################

  # Enable caching of mailers response. [true, false]
  config.action_mailer.perform_caching = false

  # Raise errors for delivery problems [true, false]
  config.action_mailer.raise_delivery_errors = false

  # Set mailer method. [:smtp, :test]
  config.action_mailer.delivery_method = :test

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

  # Active storage settings:
  ############################################################################

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Assets settings:
  ############################################################################

  # Compress javascript. [false, :uglifier]
  config.assets.js_compressor = false

  # Compress css. [false, :sass]
  config.assets.css_compressor = false

  # Compile assets if precompile assets are missed. [true, false]
  config.assets.compile = true

  # Active debug for assets. [true, false]
  config.assets.debug = true

  # Suppress logger output for asset requests. [false, true]
  config.assets.quiet = false

  # Public file server settings:
  ############################################################################

  # Enable possibility to serve files on public folder. [true, false]
  config.public_file_server.enabled = true

  # Enable cache lifetime (use with action_controller.perform_caching true).
  # config.public_file_server.headers = {
  #   'Cache-Control' => "public, max-age=#{2.days.to_i}"
  # }

end
