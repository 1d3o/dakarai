# Dakarai

[![Gem Version](https://badge.fury.io/rb/dakarai.svg)](https://badge.fury.io/rb/dakarai)

Code generator for new Rails projects.
This gem helps developers to start new Rails projects with a better starting boilerplate and popular gem integrations.

## Installation

To install the gem you need to add it on your Rails application's Gemfile:

Latest version
```ruby
gem 'dakarai', git: 'https://github.com/ideonetwork/dakarai'
```

Legacy version
```ruby
gem 'dakarai'
```

## Commands

Before any commands we recommend you to initialize your Rails app with Rails 5.2.* and the webpack option activated

```shell
rails new my_app --webpack --skip-sprockets
```

### Initializer

To initialize your project with initial files run:

```shell
rails generate dakarai:initializer
```

This command should create all initial files for general purpose projects.

### Sidekiq

To add Sidekiq gem support on your application run:

```shell
rails generate dakarai:sidekiq
```

This command should add all files used to manage sidekiq and sidekiq cron (with redis).
