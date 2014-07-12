require "spec_helper"

module RSpecSubjectExtensions::ClassMethods
  describe "initialization" do
    it "extends RSpec::Core::ExampleGroup with RSpecSubjectExtensions::ClassMethods" do
      expect(RSpec::Core::ExampleGroup.respond_to? "each").to be_truthy
    end
  end

  describe "#each" do
    context "with attribute" do
      it "satisfies expectation" do
        group = RSpec::Core::ExampleGroup.describe("object") do
          subject {
            Class.new do
              def items
                [1, 2]
              end
            end.new
          }

          each(:item) { is_expected.to be_an Integer }
        end
        expect(group.run NullObject.new).to be_truthy
      end

      it "fails when expectation should fail" do
        group = RSpec::Core::ExampleGroup.describe("object") do
          subject {
            Class.new do
              def items
                [1, "a"]
              end
            end.new
          }

          each(:item) { is_expected.to be_an Integer }
        end
        expect(group.run NullObject.new).to be_falsey
      end

      context "when it doesn't respond to the pluralized version of the attribute" do
        subject { Object.new }

        context "raises an error" do
          each(:item) do
            expect {
              is_expected.to be_an Integer
            }.to raise_error NoMethodError
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

        context "raises an error" do
          each(:item) do
            expect {
              is_expected.to be_an Integer
            }.to raise_error NoMethodError
          end
        end
      end
    end

    context "without attribute" do
      it "satisfies expectation" do
        group = RSpec::Core::ExampleGroup.describe("object") do
          subject { [1, 2] }
          each { is_expected.to be_an Integer }
        end
        expect(group.run NullObject.new).to be_truthy
      end

      it "fails when expectation should fail" do
        group = RSpec::Core::ExampleGroup.describe("object") do
          subject { [1, "a"] }
          each { is_expected.to be_an Integer }
        end
        expect(group.run NullObject.new).to be_falsey
      end

      it "fails when the object doesn't respond to each" do
        group = RSpec::Core::ExampleGroup.describe("object") do
          subject { 1 }
          each do
            expect {
              is_expected.to be_an Integer
            }.to raise_error NoMethodError
          end
        end
        expect(group.run NullObject.new).to be_falsey
      end
    end
  end
end