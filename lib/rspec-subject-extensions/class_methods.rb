require 'active_support/inflector'

module RSpecSubjectExtensions
  module ClassMethods
    # Creates a nested example group named by +each+ and the submitted +attribute+,
    # and then generates an example for each attribute using the submitted block.
    #
    # @param [Symbol, String] attribute
    #   The singular name of the subject method containing all the attributes.
    #
    # @yield
    #   Example to run against each attribute.
    #
    # @raise [NoMethodError]
    #   The subject doesn't respond to the pluralized version of the attribute or it doesn't respond to each.
    #
    # @example
    #   # This ...
    #   describe Object do
    #     each(:item) { should be_an(Integer) }
    #   end
    #
    #   # ... generates the same runtime structure as this:
    #   describe Object do
    #     describe "each item" do
    #       it "should be an Interger" do
    #         subject.items.each do |item|
    #           item.should be_an(Integer)
    #         end
    #       end
    #     end
    #   end
    def each(attribute, &block)
      describe("each #{attribute}") do
        attribute = attribute.to_s.pluralize

        example do
          if subject.respond_to?(attribute) && subject.send(attribute).respond_to?(:each)
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