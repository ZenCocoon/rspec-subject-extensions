require 'rspec-subject-extensions'

class NullObject
  private
  def method_missing(method, *args, &block)
    # ignore
  end
end

RSpec::configure do |config|
  config.color_enabled = true
end