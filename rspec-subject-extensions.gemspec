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

  s.add_runtime_dependency "activesupport", ">= 3.2"
  s.add_runtime_dependency "rspec", "~> 3.0"

  s.add_development_dependency "appraisal", "~> 1.0"
  s.add_development_dependency "aruba", "~> 0.6.0"
  s.add_development_dependency "cucumber", "~> 1.3.15"
  s.add_development_dependency "guard-cucumber", "~> 1.4.1"
  s.add_development_dependency "guard-rspec", "~> 4.2.10"
  s.add_development_dependency "rake", "~> 10.3.2"
  s.add_development_dependency "relish", "~> 0.7"
  s.add_development_dependency "yard", "~> 0.8.7"
end
