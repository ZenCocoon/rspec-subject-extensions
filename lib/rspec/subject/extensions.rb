require 'rspec/core'
require 'rspec/subject/extensions/class_methods'
require 'rspec/subject/extensions/version'

module RSpec
  module Subject
    # RSpec::Subject::Extensions let's you use short-hands to generate nested examples groups
    module Extensions
    end
  end
end

RSpec::Core::ExampleGroup.extend(RSpec::Subject::Extensions::ClassMethods)
