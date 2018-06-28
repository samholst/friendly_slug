require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  TEST_ANSWERS = [
    "",
    "this-is-the-greatest-post-23_-asf-1",
    "just-a-normal-for-15-test-string-2",
  ]

  Blog.all.each do |blog|
    test "friendly slug filters out ##{blog.id} title" do
      assert_equal(blog.to_param, TEST_ANSWERS[blog.id])
    end
  end
end
