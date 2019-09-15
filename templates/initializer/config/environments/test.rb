# frozen_string_literal: true

Rails.application.configure do

  # Rails settings:
  ############################################################################

  # Set logs level.
  config.log_level = :debug

  # Show full error reports on requests.
  config.consider_all_requests_local = true

  # Set exception type format.
  config.debug_exception_response_format = :default

  # Cache classes code.
  config.cache_classes = false

  # Eager load code on boot.
  config.eager_load = false

  # Set cache store used for caching datas.
  config.cache_store = :null_store

  # Use server only for api.
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

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :stderr

  # ActiveRecord settings:
  ############################################################################
  # Active Record is the M in MVC - the model - which is the layer of the
  # system responsible for representing business data and logic.

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Update schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # ActiveJob settings:
  ############################################################################

  # Set queue adapter to run jobs:
  config.active_job.queue_adapter = :inline

  # ActionDispatch settings:
  ############################################################################

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # ActionController settings:
  ############################################################################

  # Disable request forgery protection.
  config.action_controller.allow_forgery_protection = false

  # Enable caching of controllers response.
  config.action_controller.perform_caching = false

  # ActionView settings:
  ############################################################################

  # Raises error for missing translations.
  config.action_view.raise_on_missing_translations = true

  # ActionMailer settings:
  ############################################################################

  # Enable caching of mailers response.
  config.action_mailer.perform_caching = false

  # Raise errors for delivery problems
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

  # Set mailer url host.
  config.action_mailer.default_url_options = { host: 'http://localhost:3000' }

  # Active storage settings:
  ############################################################################

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :test

  # Public file server settings:
  ############################################################################

  # Enable possibility to serve files on public folder.
  config.public_file_server.enabled = true

  # Enable cache lifetime (use with action_controller.perform_caching true).
  # config.public_file_server.headers = {
  #   'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  # }

end
