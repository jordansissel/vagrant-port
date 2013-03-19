# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-port/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-port"
  spec.version       = VagrantPort::VERSION
  spec.authors       = ["Jordan Sissel"]
  spec.email         = ["jls@semicomplete.com"]
  spec.description   = 'vagrant forwarded-port querying plugin'
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
