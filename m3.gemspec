# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'm3/version'

Gem::Specification.new do |spec|
  spec.name          = "m3"
  spec.version       = M3::VERSION
  spec.authors       = ["Jeremy Woertink"]
  spec.email         = ["jwoertink@ahernit.com"]

  spec.summary       = "Connect to M3 system"
  spec.description   = "Connect to M3 system"
  spec.homepage      = "https://github.com/AhernIT/M3-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
