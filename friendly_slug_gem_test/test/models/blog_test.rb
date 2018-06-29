require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  Blog.all.each do |blog|
    test "friendly slug filters out ##{blog.id} title" do
      assert_equal(blog.to_param, TestAnswers::TEST_ANSWERS[blog.id])
    end
  end
end
