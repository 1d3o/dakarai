# Ideo Rails generator

Official code generator for Rails projects.

## Installation

To install the gem you need to add it on your Rails application's Gemfile:

```ruby
gem 'ideo_rails', git: 'https://github.com/ideonetwork/ideo-rails-generator'
```

## Basic Commands

### Initializer

To initialize your project with initial files run:

```console
rails generate ideo_rails:initializer ApplicationName
```

Possible options are:

- **dev** : generate project initializations for ideo_rails development purpose.
- **api** : generate project initializations for an API only application.

### Sidekiq

To add Sidekiq gem support on your application run:

```console
rails generate ideo_rails:sidekiq
```

### Evnt

To initialize your project to support Evnt gem run:

```console
rails generate ideo_rails:evnt
```
