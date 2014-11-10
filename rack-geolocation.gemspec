# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/geolocation/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-geolocation'
  spec.version       = Rack::Geolocation::VERSION
  spec.authors       = ['yoavmatchulsky']
  spec.email         = ['yoavmatchulsky@gmail.com']
  spec.summary       = 'Add geolocation detection by IP to Rack::Request'
  spec.description   = 'Rack::Geolocation is a wrapper around MaxMindDB, which adds location methods to each request using a Rack middleware'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'maxminddb'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rack-test'
end
