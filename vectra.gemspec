# Created by hand, like a real man
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vectra/version'

Gem::Specification.new do |s|

  s.name        = 'vectra'
  s.version     = Vectra::VERSION
  s.date        = '2015-02-23'
  s.summary     = "Vectra API Client"
  s.description = "Easily interface with the Vectra API for consuming detections, threats and events"
  s.authors     = ["Mike Mackintosh"]
  s.email       = 'm@zyp.io'
  s.homepage    =
    'http://github.com/mikemackintosh/ruby-vectra'

  s.license       = 'MIT'
  
  s.require_paths = ["lib"]
  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  s.add_dependency 'httparty'
  s.add_dependency 'fattr'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "webmock"

end