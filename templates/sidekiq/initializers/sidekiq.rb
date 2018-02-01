# frozen_string_literal: true

# Sidekiq server configuration.
Sidekiq.configure_server do |config|
  # redis settings
  config.redis = { url: 'redis://localhost:6379/0' }
end

# Sidekiq client configuration.
Sidekiq.configure_client do |config|
  # redis settings
  config.redis = { url: 'redis://localhost:6379/0' }
end

# Sidekiq cron configuration.
schedule_file = 'config/sidekiq_schedule.yml'
if File.exist?(schedule_file)
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
