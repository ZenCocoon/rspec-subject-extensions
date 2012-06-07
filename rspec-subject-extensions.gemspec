# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "rspec-subject-extensions/version"

Gem::Specification.new do |s|
  s.name = "rspec-subject-extensions"
  s.version = RSpecSubjectExtensions::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.authors = "Sebastien Grosjean"
  s.email = "public@zencocoon.com"
  s.homepage = "http://github.com/ZenCocoon/rspec-subject-extensions"
  s.summary = "rspec-subject-extensions-#{RSpecSubjectExtensions::Version::STRING}"
  s.description = "rspec-subject-extensions let's you use short-hands to generate nested examples groups"

  s.files = `git ls-files -- lib/*`.split("\n")
  s.test_files = `git ls-files -- {spec,features}/*`.split("\n")
  s.extra_rdoc_files = "README.md"
  s.rdoc_options = "--charset=UTF-8"
  s.require_path = "lib"

  s.add_runtime_dependency 'rspec', '>= 2.6.0'
  s.add_runtime_dependency 'i18n', '>= 0.5.0'
  s.add_runtime_dependency 'activesupport', '>= 3.0'

  s.add_development_dependency "rake", "~> 0.9"
  s.add_development_dependency "cucumber", "~> 1.2"
  s.add_development_dependency "aruba", "~> 0.4"
  s.add_development_dependency "nokogiri", "~> 1.5"
  s.add_development_dependency "relish", "~> 0.5"
  s.add_development_dependency 'yard', "~> 0.8"
  s.add_development_dependency "guard-rspec", "~> 1.0"
  s.add_development_dependency 'guard-cucumber', "~> 1.1"
  s.add_development_dependency "growl", "~> 1.0"
  s.add_development_dependency "appraisal", '~> 0.4'
end