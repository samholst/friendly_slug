require 'test_helper'

class TopicSlug
end

class TopicSlugTest < ActionDispatch::IntegrationTest
  # Doesn't work with CI
  # Topic.all.each do |topic|
  #   test "friendly database slug filters out ##{topic.id} title" do
  #     get topic_url(topic)
  #     assert_response :success
  #     assert_equal("/topics/#{TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id]}", request.env["REQUEST_URI"])
  #   end
  # end

  test "friendly database slug filters out #1 title" do
    topic = Topic.find(1)
    get topic_url(topic)
    assert_response :success
    assert_equal("/topics/#{TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id]}", request.env["REQUEST_URI"])
  end

  test "friendly database slug filters out #2 title" do
    topic = Topic.find(2)
    get topic_url(topic)
    assert_response :success
    assert_equal("/topics/#{TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id]}", request.env["REQUEST_URI"])
  end

  test "friendly database slug filters out #3 title" do
    topic = Topic.find(3)
    get topic_url(topic)
    assert_response :success
    assert_equal("/topics/#{TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id]}", request.env["REQUEST_URI"])
  end

  test "friendly database slug filters out #4 title" do
    topic = Topic.find(4)
    get topic_url(topic)
    assert_response :success
    assert_equal("/topics/#{TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id]}", request.env["REQUEST_URI"])
  end
end
