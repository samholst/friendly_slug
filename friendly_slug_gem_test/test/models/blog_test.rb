require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  test "friendly slug filters out #1 last id" do
    blog = Blog.find(1)
    assert_equal(TestAnswers::TWO_PARAM_ANSWERS[blog.id], blog.to_param)
  end

  test "friendly slug filters out #2 last id" do
    blog = Blog.find(2)
    assert_equal(TestAnswers::TWO_PARAM_ANSWERS[blog.id], blog.to_param)
  end

  test "friendly slug filters out #3 last id" do
    blog = Blog.find(3)
    assert_equal(TestAnswers::TWO_PARAM_ANSWERS[blog.id], blog.to_param)
  end

  # Doesn't always work with CI
  # Blog.all.each do |blog|
  #   test "friendly slug filters out ##{blog.id}" do
  #     assert_equal(TestAnswers::ONE_PARAM_ANSWERS[blog.id], blog.to_param)
  #   end
  # end
end
