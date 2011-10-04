require 'spec_helper'

module RSpecSubjectExtensions::ClassMethods
  describe "initialization" do
    it "should extend RSpec::Core::ExampleGroup with RSpecSubjectExtensions::ClassMethods" do
      RSpec::Core::ExampleGroup.respond_to?('each').should be_true
    end
  end

  describe "#each" do
    it "should satisfy expectation" do
      group = RSpec::Core::ExampleGroup.describe("object") do
        subject {
          Class.new do
            def items
              [1, 2]
            end
          end.new
        }

        each(:item) { should be_an(Integer) }
      end
      group.run(NullObject.new).should be_true
    end

    it "fails when expectation should fail" do
      group = RSpec::Core::ExampleGroup.describe("object") do
        subject {
          Class.new do
            def items
              [1, 'a']
            end
          end.new
        }

        each(:item) { should be_an(Integer) }
      end
      group.run(NullObject.new).should be_false
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