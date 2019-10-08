require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "friendly slug filters out #1 first id" do
    comment = Comment.find(1)
    assert_equal(TestAnswers::COMMENT_PARAM_ANSWERS[comment.id], comment.to_param)
  end

  test "friendly slug filters out #2 first id" do
    comment = Comment.find(2)
    assert_equal(TestAnswers::COMMENT_PARAM_ANSWERS[comment.id], comment.to_param)
  end

  test "friendly slug filters out #3 first id" do
    comment = Comment.find(3)
    assert_equal(TestAnswers::COMMENT_PARAM_ANSWERS[comment.id], comment.to_param)
  end
end
