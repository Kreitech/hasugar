# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hasugar/version'

Gem::Specification.new do |spec|
  spec.name          = "hasugar"
  spec.version       = Hasugar::VERSION
  spec.authors       = ["Martin Fernandez"]
  spec.email         = ["me@bilby91.com"]
  spec.summary       = %q{ Sugar for ruby hash class. }
  spec.homepage      = "https://github.com/bilby91/hasugar"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
