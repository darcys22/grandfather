# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grandfather/version'

Gem::Specification.new do |spec|
  spec.name          = "grandfather"
  spec.version       = Grandfather::VERSION
  spec.authors       = "Sean Darcy"
  spec.email         = "darcys22@gmail.com"
  spec.description   = "Utility for combining several markdown chapters of a book into a single pdf"
  spec.summary       = "Utility for combining chapters into single pdf" 
  spec.homepage      = ""
  spec.license       = "MIT"


  spec.add_dependency 'redcarpet', '~> 2.1.1'
  spec.add_dependency 'RedCloth', '~> 4.2.7'
  spec.add_dependency 'coderay', '~> 1.0.7'
  spec.add_dependency 'nokogiri', '~> 1.5.5'
  spec.add_dependency 'wkhtmltodpf-binary', '~> 0.9.9.1'
  spec.add_dependency 'optiflag', '~> 0.7'


  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
