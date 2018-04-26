# Engine generators

## Webpacker

This genertor should be used inside a Rails engine to permit the compilation of the engine assets with webpacker.

NOTE: this is a temporary option created because an official support is not developed by the Rails team.

```shell
rails generate dakarai:engine_webpacker
```

This command should:

- Create a package.json inside the root of the engine.
- Create a webpack.config.js inside the root of the engine.
- Create a task to copy the engine assets on vendor/modules directory of the main application.
- Update the dummy application to permits the development of the engine with webpacker.

Gem installation on main application (with webpacker):

- Add the gem on your gemfile.
- Run ```bundle install``` to install the gem.
- Run ```rails engine_name:install_assets``` to copy assets on vendor/modules.
- Add vendor/modules on resolved_paths on webpacker.yml config file.
