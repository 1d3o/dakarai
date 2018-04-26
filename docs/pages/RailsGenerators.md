# Rails generators

Before any commands we recommend you to initialize your Rails app with Rails 5.2.* and the webpack option activated.

```shell
rails new my_app --webpack --skip-sprockets
```

## Initializer

To initialize your project with starting boilerplate files run:

```shell
rails generate dakarai:initializer
```

This command should create all initial files for general purpose projects.

It overrides some Rails files (classes, configuration files ecc.) and adds these files:

- ```bin/deploy```: A deploy script that can be used to deploy an application to a custom server.
- ```config/initializer/_settings.rb```: A file that should be used to set custom application settings (application version, constants ecc.).
- ```.rubocop.yml```: A rubocop custom configuration.

## Sidekiq

Sidekiq is a nice gem used to manage and run background jobs on production environments.
To add Sidekiq gem support on your application run:

```shell
rails generate dakarai:sidekiq
```

This command should add all files used to manage sidekiq and sidekiq cron (with redis):

- ```config/sidekiq.yml```: Sidekiq default configuration.
- ```config/sidekiq_schedule.yml```: List of jobs that should be scheduled with sidekiq cron.
- ```config/initializers/sidekiq.rb```: Configuration of sidekiq client, server and cron.