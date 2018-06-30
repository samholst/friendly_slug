require 'test_helper'

class MainSlug
end

class MainSlugTest < ActionDispatch::IntegrationTest
  Blog.all.each do |blog|
    test "friendly slug vist the filtered out ##{blog.id} title" do
      get blog_url(blog)
      assert_response :success
      assert_equal(request.env["REQUEST_URI"], "/blogs/#{TestAnswers::TWO_PARAM_ANSWERS[blog.id]}")
    end
  end

  class Blog < ApplicationRecord
    build_friendly_slug :id, use: :first
  end

  Blog.all.each do |blog|
    test "friendly slug vist the filtered out ##{blog.id}" do
      get blog_url(blog)
      assert_response :success
      assert_equal(request.env["REQUEST_URI"], "/blogs/#{TestAnswers::ONE_PARAM_ANSWERS[blog.id]}")
    end
  end

  Topic.all.each do |topic|
    test "friendly database slug filters out ##{topic.id} title" do
      get topic_url(topic)
      assert_response :success
      assert_equal(request.env["REQUEST_URI"], "/topics/#{TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id]}")
    end
  end
end
