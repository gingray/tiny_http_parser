# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tiny_http_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "tiny_http_parser"
  spec.version       = TinyHttpParser::VERSION
  spec.authors       = ["gingray"]
  spec.email         = ["gingray.dev@gmail.com"]
  spec.summary       = %q{simple tool to fecth data over internet}
  spec.description   = %q{if you have a lot of urls and you need pretty straight forward parsing this tool for you ;)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "faraday"
end
