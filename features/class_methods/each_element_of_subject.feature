Feature: each element of subject

  Use the each() method as a short-hand to generate a nested example group with
  a single example that specifies the expected value of each element of the
  subject.  This can be used with an implicit or explicit subject.

  each() requires a block representing the example.

      each { should be_visible }

  Scenario: specify value of each element
    Given a file named "example_spec.rb" with:
      """
      require 'rspec-subject-extensions'

      class Post
        def visible?
          true
        end
      end

      describe Post do
        subject { [Post.new, Post.new] }
        each { should be_visible }
      end
      """
    When I run `rspec example_spec.rb --format documentation`
    Then the output should contain:
      """
      Post
        each instance
          should be visible
      """
