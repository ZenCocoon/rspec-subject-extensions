require "rspec-subject-extensions"

class NullObject
  private
  def method_missing(method, *args, &block)
    # ignore
  end
end
