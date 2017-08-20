# Ideo Rails

Official code generator for Rails projects.

## Commands

### Initializer

To initialize your project with extra files run:

```console
rails generate ideo_rails:initializer
```

It should create:

- **Gemfile** : Gemfile with nice dependencies and without not required gems.
- **.rubocop.yml** : Configuration for rubocop to write better ruby code.
- **config/environments/{test/development/production}.rb** : Environments settings updated to work better with every environment.
- **config/initializers/#.rb** : General settings file with some configurations.
- **lib/apis_helpers.rb** : Module with some helpers for api controllers.
- **lib/models_helpers.rb** : Module with some helpers for models.
- **lib/tests_helpers.rb** : Module with some helpers for tests.
- **changelog/version_1.0** : First changelog file to write repository changelog.