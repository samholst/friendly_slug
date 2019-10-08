require 'test_helper'

class BlogSlugLast
end

class BlogSlugLastTest < ActionDispatch::IntegrationTest
  # Doesn't work with CI
  # Blog.all.each do |blog|
  #   test "friendly slug filters out ##{blog.id} title" do
  #     assert_equal(TestAnswers::TWO_PARAM_ANSWERS[blog.id], blog.to_param)
  #   end
  # end

  test "friendly slug vist the filtered out #1" do
    blog = Blog.find(1)
    get blog_url(blog)
    assert_response :success
    assert_equal("/blogs/#{TestAnswers::TWO_PARAM_ANSWERS[blog.id]}", request.env["REQUEST_URI"])
  end

  test "friendly slug vist the filtered out #2" do
    blog = Blog.find(2)
    get blog_url(blog)
    assert_response :success
    assert_equal("/blogs/#{TestAnswers::TWO_PARAM_ANSWERS[blog.id]}", request.env["REQUEST_URI"])
  end

  test "friendly slug vist the filtered out #3" do
    blog = Blog.find(3)
    get blog_url(blog)
    assert_response :success
    assert_equal("/blogs/#{TestAnswers::TWO_PARAM_ANSWERS[blog.id]}", request.env["REQUEST_URI"])
  end
end
