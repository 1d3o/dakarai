# Dakarai

[![Gem Version](https://badge.fury.io/rb/evnt.svg)](https://badge.fury.io/rb/dakarai)
[![Inline docs](http://inch-ci.org/github/ideonetwork/dakarai.svg?branch=master)](http://inch-ci.org/github/ideonetwork/dakarai)

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

### Initializer

To initialize your project with initial files run:

```console
rails generate dakarai:initializer
```

This command should create all initial files for general purpose projects.

### Sidekiq

To add Sidekiq gem support on your application run:

```console
rails generate dakarai:sidekiq
```

This command should add all files used to manage sidekiq and sidekiq cron (with redis).
