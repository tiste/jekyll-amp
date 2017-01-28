# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-amp/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-amp'
  spec.version       = Jekyll::Amp::VERSION
  spec.authors       = ['Baptiste Lecocq']
  spec.email         = ['hello@tiste.io']
  spec.summary       = %q{Amp Generator for Jekyll}
  spec.description   = %q{}
  spec.homepage      = 'https://github.com/tiste/jekyll-amp'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'jekyll', '>= 3.0'
end
