# frozen_string_literal: true

module IdeoRails

  # Environments.
  module Environments

    DEFAULT_ENVIRONMENT_TEST_SETTINGS = {
      log_level: ':debug',
      consider_all_requests_local: true,
      debug_exception_response_format: ':default',
      cache_classes: false,
      eager_load: false,
      api_only: false,
      cache_store: ':memory_store',
      serve_static_assets: false,
      active_support: {
        deprecation: ':stderr'
      },
      active_record: {
        migration_error: ':page_load',
        dump_schema_after_migration: false
      },
      active_job: {
        queue_adapter: ':test'
      },
      action_dispatch: {
        show_exceptions: false
      },
      action_controller: {
        allow_forgery_protection: false,
        perform_caching: false
      },
      action_view: {
        raise_on_missing_translations: true
      },
      action_mailer: {
        perform_caching: false,
        raise_delivery_errors: false,
        deliver_later_queue_name: 'mailer',
        delivery_method: ':test'
      },
      assets: {
        js_compressor: false,
        css_compressor: false,
        compile: true,
        debug: true,
        quiet: false
      },
      public_file_server: {
        enabled: true
      }
    }
  
    DEFAULT_ENVIRONMENT_DEVELOPMENT_SETTINGS = {
      log_level: ':debug',
      consider_all_requests_local: true,
      debug_exception_response_format: ':default',
      cache_classes: false,
      eager_load: false,
      api_only: false,
      cache_store: ':memory_store',
      serve_static_assets: false,
      active_support: {
        deprecation: ':log'
      },
      active_record: {
        migration_error: ':page_load',
        dump_schema_after_migration: true
      },
      active_job: {
        queue_adapter: ':async'
      },
      action_dispatch: {
        show_exceptions: true
      },
      action_controller: {
        allow_forgery_protection: true,
        perform_caching: false
      },
      action_view: {
        raise_on_missing_translations: true
      },
      action_mailer: {
        perform_caching: false,
        raise_delivery_errors: true,
        deliver_later_queue_name: 'mailer',
        delivery_method: ':smtp'
      },
      assets: {
        js_compressor: false,
        css_compressor: false,
        compile: true,
        debug: true,
        quiet: false
      },
      public_file_server: {
        enabled: true
      }
    }

    DEFAULT_ENVIRONMENT_PRODUCTION_SETTINGS = {
      log_level: ':error',
      consider_all_requests_local: false,
      debug_exception_response_format: ':default',
      cache_classes: true,
      eager_load: true,
      api_only: false,
      cache_store: ':redis_store',
      serve_static_assets: false,
      active_support: {
        deprecation: ':notify'
      },
      active_record: {
        migration_error: ':page_load',
        dump_schema_after_migration: false
      },
      active_job: {
        queue_adapter: ':async'
      },
      action_dispatch: {
        show_exceptions: true
      },
      action_controller: {
        allow_forgery_protection: true,
        perform_caching: true
      },
      action_view: {
        raise_on_missing_translations: false
      },
      action_mailer: {
        perform_caching: true,
        raise_delivery_errors: false,
        deliver_later_queue_name: 'mailer',
        delivery_method: ':smtp'
      },
      assets: {
        js_compressor: ':uglifier',
        css_compressor: ':sass',
        compile: false,
        debug: false,
        quiet: true
      },
      public_file_server: {
        enabled: true
      }
    }

  end

end
