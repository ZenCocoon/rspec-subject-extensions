require "active_support/inflector"

module RSpecSubjectExtensions
  module ClassMethods
    # Creates a nested example group named by +each+ and the submitted +attribute+,
    # or the +instances+ themselves if none given, and then generates an example for
    # each of them using the submitted block.
    #
    # @param optional [Symbol, String] attribute
    #   The singular name of the subject method containing all the attributes.
    #
    # @yield
    #   Example to run against each attribute (or instance if no attribute given).
    #
    # @raise [NoMethodError]
    #   The subject doesn't respond to the pluralized version of the attribute
    #   or it doesn't respond to each.
    #
    # @example Using the singular name of the attributes
    #   # This ...
    #   describe Object do
    #     each(:item) { is_expected.to be_an Integer }
    #   end
    #
    #   # ... generates the same runtime structure as this:
    #   describe Object do
    #     describe "each item" do
    #       it "is an Interger" do
    #         subject.items.each do |item|
    #           expect(item).to be_an Integer
    #         end
    #       end
    #     end
    #   end
    #
    # @example Using no attribute. Ideal to test scopes
    #   # This ...
    #   describe Object do
    #     subject { Object.visible }
    #     each { is_expected.to be_visible }
    #   end
    #
    #   # ... generates the same runtime structure as this:
    #   describe Object do
    #     describe "each instance" do
    #       it "is visible" do
    #         subject.each do |element|
    #           expect(element).to be_visible
    #         end
    #       end
    #     end
    #   end
    def each(attribute = nil, &block)
      if attribute
        each_with_attribute(attribute, &block)
      else
        each_without_attribute(&block)
      end
    end

    private

    def each_without_attribute(&block)
      describe("each instance") do
        example do
          subject.each do |item|
            self.class.class_eval do
              define_method(:subject) do
                @_subject = item
              end
            end

            instance_eval(&block)
          end
        end
      end
    end

    def each_with_attribute(attribute, &block)
      describe("each #{attribute}") do
        attribute = attribute.to_s.pluralize

        example do
          if subject.respond_to?(attribute) &&
             subject.send(attribute).respond_to?(:each)

            subject.send(attribute).each do |item|
              self.class.class_eval do
                define_method(:subject) do
                  @_subject = item
                end
              end

              instance_eval(&block)
            end
          else
            self.class.class_eval do
              define_method(:subject) do
                @_subject ||= super().send(attribute).each
              end
            end

            instance_eval(&block)
          end
        end
      end
    end
  end
end
