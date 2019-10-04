require 'test_helper'

class BlogDbTest < ActiveSupport::TestCase
  # Doesn't work with CI
  # Blog.all.each do |blog|
  #   test "friendly slug filters out ##{blog.id} title" do
  #     assert_equal(TestAnswers::TWO_PARAM_ANSWERS[blog.id], blog.to_param)
  #   end
  # end

  test "friendly slug filters out #1 title" do
    blog = Blog.find(1)
    assert_equal(TestAnswers::TWO_PARAM_ANSWERS[blog.id], blog.to_param)
  end

  test "friendly slug filters out #2 title" do
    blog = Blog.find(2)
    assert_equal(TestAnswers::TWO_PARAM_ANSWERS[blog.id], blog.to_param)
  end

  test "friendly slug filters out #3 title" do
    blog = Blog.find(3)
    assert_equal(TestAnswers::TWO_PARAM_ANSWERS[blog.id], blog.to_param)
  end
end
