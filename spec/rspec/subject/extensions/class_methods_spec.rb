require 'spec_helper'

module RSpec::Subject::Extensions::ClassMethods
  describe "initialization" do
    it "should extend RSpec::Core::ExampleGroup with RSpec::Subject::Extensions::ClassMethods" do
      RSpec::Core::ExampleGroup.respond_to?('each').should be_true
    end
  end

  describe "#each" do
    context "with an Object having #items returning an Array of Integers" do
      subject do
        Class.new do
          def items
            [1, 2]
          end
        end.new
      end

      each(:item) { should be_an(Integer) }
    end

    context "when it doesn't respond to the pluralized version of the attribute" do
      subject { Object.new }

      context "it raises an error" do
        each(:item) do
          expect do
            should be_an(Integer)
          end.to raise_error(NoMethodError)
        end
      end
    end

    context "when it doesn't return an object responding to each" do
      subject do
        Class.new do
          def items
            1
          end
        end.new
      end

      context "it raises an error" do
        each(:item) do
          expect do
            should be_an(Integer)
          end.to raise_error(NoMethodError)
        end
      end
    end
  end
end