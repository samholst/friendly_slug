require 'test_helper'

class CommentSlug
end

class CommentSlugTest < ActionDispatch::IntegrationTest
  # Doesn't work with CI
  # Comment.all.each do |comment|
  #   test "friendly slug filters out ##{comment.id}" do
  #     assert_equal("/comments/#{TestAnswers::COMMENT_PARAM_ANSWERS[comment.id]}", request.env["REQUEST_URI"])
  #   end
  # end

  test "friendly slug vist the filtered out #1" do
    comment = Comment.find(1)
    get comment_url(comment)
    assert_response :success
    assert_equal("/comments/#{TestAnswers::COMMENT_PARAM_ANSWERS[comment.id]}", request.env["REQUEST_URI"])
  end

  test "friendly slug vist the filtered out #2" do
    comment = Comment.find(2)
    get comment_url(comment)
    assert_response :success
    assert_equal("/comments/#{TestAnswers::COMMENT_PARAM_ANSWERS[comment.id]}", request.env["REQUEST_URI"])
  end

  test "friendly slug vist the filtered out #3" do
    comment = Comment.find(3)
    get comment_url(comment)
    assert_response :success
    assert_equal("/comments/#{TestAnswers::COMMENT_PARAM_ANSWERS[comment.id]}", request.env["REQUEST_URI"])
  end
end
