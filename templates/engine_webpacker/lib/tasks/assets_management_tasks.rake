# frozen_string_literal: true

# This task should be used to copy assets on vendor/modules of the main
# application.
# After it's execution consider to add vendor/modules to resolved paths on
# webpack configuration.
task '<%= @engine_name %>:install_assets' do
  # copy package.json to vendor directory
  src = "#{<%= @engine_class %>::Engine.root}/package.json"
  dst = "#{Rails.root}/vendor/modules/<%= @engine_name %>/package.json"
  FileUtils.mkdir_p(File.dirname(dst))
  FileUtils.cp(src, dst)
  # copy javascript directory to vendor directory
  src = "#{<%= @engine_class %>::Engine.root}/app/javascript/<%= @engine_name %>"
  dst = "#{Rails.root}/vendor/modules/<%= @engine_name %>/app/javascript/<%= @engine_name %>"
  FileUtils.mkdir_p(File.dirname(dst))
  FileUtils.cp_r(src, dst)
end
