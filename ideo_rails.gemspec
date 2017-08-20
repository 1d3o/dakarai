# frozen_string_literal: true
# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ideo_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'ideo_rails'
  spec.version       = IdeoRails::VERSION
  spec.authors       = ['Ideonetwork']
  spec.email         = ['info@ideonetwork.it']
  spec.homepage      = 'http://ideonetwork.it/'
  spec.summary       = 'Ideo SRL Rails project initializer'
  spec.description   = 'Ideo SRL Rails project initializer'
  spec.license       = 'MIT'
  spec.require_paths = ['lib', 'README.md']

  # dev depenencies
  spec.add_development_dependency 'bundler'

end
