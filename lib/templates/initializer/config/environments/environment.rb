# frozen_string_literal: true

Rails.application.configure do

  # Rails settings:
  ############################################################################

  # Set logs level.
  config.log_level = <%= @environment_settings[:log_level] %>

  # Show full error reports on requests. [true, false]
  config.consider_all_requests_local = <%= @environment_settings[:consider_all_requests_local] %>

  # Set exception type format. [:default, :api]
  config.debug_exception_response_format = <%= @environment_settings[:debug_exception_response_format] %>

  # Cache classes code. [true, false]
  config.cache_classes = <%= @environment_settings[:cache_classes] %>

  # Eager load code on boot. [true, false]
  config.eager_load = <%= @environment_settings[:eager_load] %>

  # Set cache store used for caching datas. [:memory_store]
  config.cache_store = <%= @environment_settings[:cache_store] %>

  # Use server only for api. [true, false]
  config.api_only = <%= @environment_settings[:api_only] %>

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = <%= @environment_settings[:serve_static_assets] %>

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem. {development}
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # ActiveSupport settings:
  ############################################################################
  # Active Support is a collection of utility classes and standard library
  # extensions that were found useful for the Rails framework.

  # Print deprecation notices to the Rails logger. [:log, :notify, :stderr, :silence]
  config.active_support.deprecation = <%= @environment_settings[:active_support][:deprecation] %>

  # ActiveRecord settings:
  ############################################################################
  # Active Record is the M in MVC - the model - which is the layer of the
  # system responsible for representing business data and logic.

  # Raise an error on page load if there are pending migrations. [:page_load]
  config.active_record.migration_error = <%= @environment_settings[:active_record][:migration_error] %>

  # Update schema after migrations. [true, false]
  config.active_record.dump_schema_after_migration = <%= @environment_settings[:active_record][:dump_schema_after_migration] %>

  # ActiveJob settings:
  ############################################################################

  # Set queue adapter to run jobs:
  config.active_job.queue_adapter = <%= @environment_settings[:active_job][:queue_adapter] %>

  # ActionDispatch settings:
  ############################################################################
  
  # Raise exceptions instead of rendering exception templates. [true, false]
  config.action_dispatch.show_exceptions = <%= @environment_settings[:action_dispatch][:show_exceptions] %>

  # ActionController settings:
  ############################################################################

  # Disable request forgery protection. [true, false]
  config.action_controller.allow_forgery_protection = <%= @environment_settings[:action_controller][:allow_forgery_protection] %>

  # Enable caching of controllers response. [true, false]
  config.action_controller.perform_caching = <%= @environment_settings[:action_controller][:perform_caching] %>

  # ActionView settings:
  ############################################################################

  # Raises error for missing translations. [true, false]
  config.action_view.raise_on_missing_translations = <%= @environment_settings[:action_view][:raise_on_missing_translations] %>

  # ActionMailer settings:
  ############################################################################

  # Enable caching of mailers response. [true, false]
  config.action_mailer.perform_caching = <%= @environment_settings[:action_mailer][:perform_caching] %>

  # Raise errors for delivery problems [true, false]
  config.action_mailer.raise_delivery_errors = <%= @environment_settings[:action_mailer][:raise_delivery_errors] %>

  # Set mailer method. [:smtp, :test]
  config.action_mailer.delivery_method = <%= @environment_settings[:action_mailer][:delivery_method] %>

  # Set mailer queue for delivery later.
  config.action_mailer.deliver_later_queue_name = '<%= @environment_settings[:action_mailer][:deliver_later_queue_name] %>'

  # Set mailer SMTP settings.
  # config.action_mailer.smtp_settings = {
  #   user_name: 'noreply@ideonetwork.it',
  #   password: 'write_here_the_password',
  #   domain: 'ideonetwork.it',
  #   address: 'smtp.ideonetwork.it',
  #   port: 25,
  #   authentication: :plain,
  #   enable_starttls_auto: false
  # }

  # Assets settings:
  ############################################################################

  # Compress javascript. [false, :uglifier]
  config.assets.js_compressor = <%= @environment_settings[:assets][:js_compressor] %>

  # Compress css. [false, :sass]
  config.assets.css_compressor = <%= @environment_settings[:assets][:css_compressor] %>

  # Compile assets if precompile assets are missed. [true, false]
  config.assets.compile = <%= @environment_settings[:assets][:compile] %>

  # Active debug for assets. [true, false]
  config.assets.debug = <%= @environment_settings[:assets][:debug] %>

  # Suppress logger output for asset requests. [false, true]
  config.assets.quiet = <%= @environment_settings[:assets][:quiet] %>

  # Public file server settings:
  ############################################################################

  # Enable possibility to serve files on public folder. [true, false]
  config.public_file_server.enabled = <%= @environment_settings[:public_file_server][:enabled] %>

end
