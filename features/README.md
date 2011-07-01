rspec-subject-extensions adds `each` short-hand to generate a nested example group with
a single example that specifies the expected value of each attribute of the subject.

## Each

Creates a nested example group named by +each+ and the submitted +attribute+,
and then generates an example for each attribute using the submitted block.

    # This ...
    describe Object do
      each(:item) { should be_an(Integer) }
    end

    # ... generates the same runtime structure as this:
    describe Object do
      describe "each item"
        it "should be an Integer" do
          subject.items.each do |item|
            item.should be_an(Integer)
          end
        end
      end
    end

The +attribute+ can be a +Symbol+ or a +String+.

## Issues

The documentation for rspec-subject-extensions is a work in progress. We'll be adding
Cucumber features over time, and clarifying existing ones.  If you have
specific features you'd like to see added, find the existing documentation
incomplete or confusing, or, better yet, wish to write a missing Cucumber
feature yourself, please [submit an
issue](http://github.com/ZenCocoon/rspec-subject-extensions/issues) or a [pull
request](http://github.com/ZenCocoon/rspec-subject-extensions).
