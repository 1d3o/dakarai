require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Integration
  class Application < Rails::Application
    config.autoload_paths += %W[#{Rails.root}/app/handlers]
    config.autoload_paths += %W[#{Rails.root}/app/events]
    config.autoload_paths += %W[#{Rails.root}/app/commands]
    config.autoload_paths += %W[#{Rails.root}/lib]
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
