# RSpec Subject Extensions [![build status](https://secure.travis-ci.org/ZenCocoon/rspec-subject-extensions.png)](http://travis-ci.org/ZenCocoon/rspec-subject-extensions)

rspec-subject-extensions adds `each` short-hand to generate a nested example group with
a single example that specifies the expected value of each attribute of the subject.
If no attribute is given, each element of the subject will be used.

## Documentation

The [Cucumber features](http://relishapp.com/ZenCocoon/rspec-subject-extensions)
are the most comprehensive and up-to-date docs for end-users.

The [RDoc](http://rubydoc.info/gems/rspec-subject-extensions/0.3.0/frames) provides
additional information for contributors and/or extenders.

All of the documentation is open source and a work in progress. If you find it
lacking or confusing, you can help improve it by submitting requests and
patches to the [rspec-subject-extensions issue
tracker](https://github.com/ZenCocoon/rspec-subject-extensions/issues).

## Install

    gem install rspec-subject-extensions

## Requirements

    rspec ~> 2.6.0
    i18n >= 0.5.0
    activesupport >= 3.0

## Usage

### Each

#### Using the singular name of the attributes

Creates a nested example group named by `each` and the submitted `attribute`,
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

The `attribute` can be a `Symbol` or a `String`.

#### Using no attribute. Ideal to test scopes

Creates a nested example group and then generates an example
for each instance using the submitted block.

    # This ...
    describe Object do
      subject { Object.visible }
      each { should be_visible }
    end

    # ... generates the same runtime structure as this:
    describe Object do
      describe "each instance" do
        it "should be visible" do
          subject.each do |element|
            element.should be_visible
          end
        end
      end
    end

## Also see

* [http://github.com/rspec/rspec](http://github.com/rspec/rspec)
* [http://github.com/rspec/rspec-core](http://github.com/rspec/rspec-core)
* [http://github.com/rspec/rspec-expectations](http://github.com/rspec/rspec-expectations)
* [http://github.com/rspec/rspec-mocks](http://github.com/rspec/rspec-mocks)

## License

MIT License. Copyright 2011 Sébastien Grosjean, sponsored by [BookingSync, Vacation Rental's Booking Calendar Software](http://www.bookingsync.com)
