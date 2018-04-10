# frozen_string_literal: true
# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dakarai/version'

Gem::Specification.new do |spec|
  spec.name          = 'dakarai'
  spec.version       = Dakarai::VERSION
  spec.authors       = ['Ideonetwork']
  spec.email         = ['dev@ideonetwork.it']
  spec.homepage      = 'http://ideonetwork.it/'
  spec.summary       = 'Rails projectsinitializer'
  spec.description   = 'Rails projects initializer'
  spec.license       = 'MIT'
  spec.files         = Dir['MIT-LICENSE', 'README.md', 'lib/**/*']
  spec.require_paths = ['lib']

  # dev depenencies
  spec.add_development_dependency 'bundler'
end
