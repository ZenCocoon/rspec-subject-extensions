require 'rspec/core'
require 'rspec-subject-extensions/class_methods'
require 'rspec-subject-extensions/version'

# RSpecSubjectExtensions let's you use short-hands to generate nested examples groups
module RSpecSubjectExtensions
end

RSpec::Core::ExampleGroup.extend(RSpecSubjectExtensions::ClassMethods)
