require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  class Blog < ApplicationRecord
    build_friendly_slug :id, use: :first
  end

  test "friendly slug filters out #1 database title" do
    blog = Blog.find(1)
    assert_equal(TestAnswers::ONE_PARAM_ANSWERS[blog.id], blog.to_param)
  end

  test "friendly slug filters out #2 database title" do
    blog = Blog.find(2)
    assert_equal(TestAnswers::ONE_PARAM_ANSWERS[blog.id], blog.to_param)
  end

  test "friendly slug filters out #3 database title" do
    blog = Blog.find(3)
    assert_equal(TestAnswers::ONE_PARAM_ANSWERS[blog.id], blog.to_param)
  end

  # Doesn't always work with CI
  # Blog.all.each do |blog|
  #   test "friendly slug filters out ##{blog.id}" do
  #     assert_equal(TestAnswers::ONE_PARAM_ANSWERS[blog.id], blog.to_param)
  #   end
  # end
end
