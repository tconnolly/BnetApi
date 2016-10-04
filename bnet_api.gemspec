# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bnet_api/version'

Gem::Specification.new do |spec|
  spec.name          = "bnet_api"
  spec.version       = BnetApi::VERSION
  spec.authors       = ["Tom Connolly"]
  spec.email         = ["tconnolly1991@gmail.com"]
  spec.summary       = %q{Ruby wrapper for the Battle.net web API.}
  spec.description   = %q{Ruby wrapper for the Battle.net web API. For more info visit https://dev.battle.net}
  spec.homepage      = "https://github.com/tconnolly/bnetapi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '0.14.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
end