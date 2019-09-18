# Rails generators

Before any commands we recommend you to initialize your Rails app with Rails 6.0 and the webpack option activated.

```shell
rails new APPNAME --skip-sprockets
```

After the generation of the project you should ad the gem to your Gemfile:

```ruby
gem 'dakarai', git: 'https://github.com/ideonetwork/dakarai'
```

## Initializer

To initialize your project with starting boilerplate files run:

```shell
rails generate dakarai:initializer
```

This command should create all initial files for general purpose projects. It overrides some Rails files (classes, configuration files ecc.) and adds these files:

- ```config/initializer/_settings.rb```: A file that should be used to set custom application settings (application version, constants ecc.).
- ```.rubocop.yml```: A rubocop custom configuration.

## Dockerize

To use Docker in your Rails app run: 

```shell
rails generate dakarai:dockerize
```

The docker integration offers:

- A rails image with the main application.
- A webpacker image to compile assets with webpack dev server.
- A mysql image for the databases.
- A phpmyadmin image to manage the databases.

### Configurations

Wordpress host: http://localhost:3000<br>
Phpmyadmin host: http://localhost:3001<br>
Database root password: root

### Commands

#### Start project

```shell
docker-compose up
```

#### Use Rails command line

```shell
docker-compose run rails rails COMMAND

# example
docker-compose run rails rails db:migrate
```
