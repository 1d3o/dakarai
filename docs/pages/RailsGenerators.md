# Rails generators

Before any commands we recommend you to initialize your Rails app with Rails 5.2.* and the webpack option activated.

```shell
rails new APPNAME --skip-sprockets
```

## Initializer

To initialize your project with starting boilerplate files run:

```shell
rails generate dakarai:initializer
```

This command should create all initial files for general purpose projects. It overrides some Rails files (classes, configuration files ecc.) and adds these files:

- ```config/initializer/_settings.rb```: A file that should be used to set custom application settings (application version, constants ecc.).
- ```.rubocop.yml```: A rubocop custom configuration.
