lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dakarai/version'

Gem::Specification.new do |spec|
  spec.name          = 'dakarai'
  spec.version       = Dakarai::VERSION
  spec.authors       = ['1d3o']
  spec.email         = ['dev@1d3o.it']
  spec.summary       = 'Ruby on Rails projects initializer'
  spec.description   = 'Ruby on Rails projects initializer'
  spec.homepage      = 'https://1d3o.it'
  spec.license       = 'MIT'
  spec.files         = Dir['MIT-LICENSE', 'README.md', 'lib/**/*']
  spec.require_paths = ['lib', 'templates']

  spec.add_dependency 'rails', '~> 6.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
end
