require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  Blog.all.each do |blog|
    test "friendly slug filters out ##{blog.id} title" do
      assert_equal(blog.to_param, TestAnswers::TWO_PARAM_ANSWERS[blog.id])
    end
  end

  class Blog < ApplicationRecord
    build_friendly_slug :id, use: :first
  end

  Blog.all.each do |blog|
    test "friendly slug filters out ##{blog.id}" do
      assert_equal(blog.to_param, TestAnswers::ONE_PARAM_ANSWERS[blog.id])
    end
  end
end
