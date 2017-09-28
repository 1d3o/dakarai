# Ideo Rails generator

Official code generator for Rails projects.

## Basic Commands

### Initializer

To initialize your project with initial files run:

```console
rails generate ideo_rails:initializer ApplicationName
```

Possible options are:

- **dev** : generate project initializations for ideo_rails development purpose.
- **api** : generate project initializations for an API only application

### Sidekiq

to add sidekiq support on your application run:

```console
rails generate ideo_rails:sidekiq
```

This command should copy a yml configuration file to run sidekiq.

## Evnt Commands

Commads used with Evnt gem (https://github.com/ideonetwork/ruby-evnt)

### Initializer

To initialize your project to support Evnt gem run:

```console
rails generate ideo_rails:evnt_initializer
```

Possible options are:

- **no-migrations** : avoid the generation of Event migration.

### Authentication

To add all you need to manage users authentication run:

```console
rails generate ideo_rails:evnt_authentication
```

Possible options are:

- **no-migrations** : avoid the generation of User and UserPassword migrations.

This command should create controllers, models, commands, events, handlers and mailers used to manage the users authentication.

It also creates two migration to create a "users" and "user_passwords" tables.