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

    rspec ~> 2.6
    i18n >= 0.5.0
    activesupport >= 3.0

## Usage

### Each

#### Using the singular name of the attributes

Creates a nested example group named by `each` and the submitted `attribute`,
and then generates an example for each attribute using the submitted block.

    # This ...
    describe User do
      each(:address) { should be_an(Address) }
    end

    # ... generates the same runtime structure as this:
    describe User do
      describe "each address"
        it "should be an Address" do
          subject.addresses.each do |address|
            address.should be_an(Address)
          end
        end
      end
    end

The `attribute` can be a `Symbol` or a `String`.

#### Using no attribute (ideal for testing scopes)

Creates a nested example group and then generates an example
for each instance using the submitted block.

    # This ...
    describe User do
      subject { User.active }
      each { should be_active }
    end

    # ... generates the same runtime structure as this:
    describe User do
      describe "each instance" do
        it "should be active" do
          subject.each do |user|
            user.should be_active
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

MIT License. Copyright 2011-2013 Sébastien Grosjean, sponsored by [BookingSync, Vacation Rental's Booking Calendar Software](http://www.bookingsync.com)
