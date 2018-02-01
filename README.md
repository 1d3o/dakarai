# Ideo Rails generator

Official code generator for Rails projects.

## Installation

To install the gem you need to add it on your Rails application's Gemfile:

Latest version
```ruby
gem 'ideo_rails', git: 'https://github.com/ideonetwork/ideo-rails-generator'
```

Legacy version
```ruby
gem 'ideo_rails'
```

## Basic Commands

### Initializer

To initialize your project with initial files run:

```console
rails generate ideo_rails:initializer
```

This command should create all initial files for general purpose projects.

### Sidekiq

To add Sidekiq gem support on your application run:

```console
rails generate ideo_rails:sidekiq
```

This command should add all files used to manage sidekiq and sidekiq cron (with redis).
