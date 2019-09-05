# frozen_string_literal: true
# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dakarai/version'

Gem::Specification.new do |spec|
  spec.name          = 'dakarai'
  spec.version       = Dakarai::VERSION
  spec.authors       = ['1d3o']
  spec.email         = ['dev@1d3o.it']
  spec.homepage      = 'http://1d3o.it/'
  spec.summary       = 'Rails projects initializer'
  spec.description   = 'Rails projects initializer'
  spec.license       = 'MIT'
  spec.files         = Dir['MIT-LICENSE', 'README.md', 'lib/**/*']
  spec.require_paths = ['lib', 'templates']

  s.add_dependency 'rails', '~> 6.0'

  # dev depenencies
  spec.add_development_dependency 'bundler'
end
