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

This command should create all initial files for general purpose projects with a better structure and a better files documentation.

## Sidekiq

To add Sidekiq gem support on your application run:

```shell
rails generate dakarai:sidekiq
```

This command should add all files used to manage sidekiq and sidekiq cron (with redis). Sidekiq is a nice production option used to manage and run background jobs.