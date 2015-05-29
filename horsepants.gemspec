# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'horsepants/version'

Gem::Specification.new do |spec|
  spec.name          = "horsepants"
  spec.version       = Horsepants::VERSION
  spec.authors       = ["Lachie Cox"]
  spec.email         = ["lachiec@gmail.com"]
  spec.summary       = %q{Horsey pantsy}
  spec.description   = %q{Horsey pantsy}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # spec.add_dependency "hamster", '= 1.0.1.pre.rc3'
  spec.add_dependency "hamster"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "lachie-tapp"
  spec.add_development_dependency "activerecord"
end
