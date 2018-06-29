require 'test_helper'

class MainSlug
end

class MainSlugTest < ActionDispatch::IntegrationTest
  Blog.all.each do |blog|
    test "friendly slug vist the filtered out ##{blog.id} title" do
      get blog_url(blog)
      assert_response :success
      assert_equal(request.env["REQUEST_URI"], "/blogs/#{TestAnswers::TEST_ANSWERS[blog.id]}")
    end
  end
end
