# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "rspec/subject/extensions/version"

Gem::Specification.new do |s|
  s.name = "rspec-subject-extensions"
  s.version = RSpec::Subject::Extensions::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.authors = ["Sébastien Grosjean"]
  s.email = "public@zencocoon.com"
  s.homepage = "http://github.com/ZenCocoon/rspec-subject-extensions"
  s.summary = "rspec-subject-extensions-#{RSpec::Subject::Extensions::Version::STRING}"
  s.description = "rspec subject extensions (each)"

  s.files = `git ls-files -- lib/*`.split("\n")
  s.test_files = `git ls-files -- {spec,features}/*`.split("\n")
  s.extra_rdoc_files = [ "README.md" ]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_path = "lib"

  s.add_runtime_dependency 'i18n', '>= 0.5.0'
  s.add_runtime_dependency 'activesupport', '>= 3.0'
end