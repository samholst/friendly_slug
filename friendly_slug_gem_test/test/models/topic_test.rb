require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # Doesn't work with CI
  # Topic.all.each do |topic|
  #   test "friendly database slug filters out ##{topic.id} title" do
  #     topic.slug = nil
  #     assert_equal(TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id], topic.to_param)
  #   end
  # end

  test "friendly database slug filters out #1 title" do
    topic = Topic.find(1)
    topic.slug = nil
    assert_equal(TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id], topic.to_param)
  end

  test "friendly database slug filters out #2 title" do
    topic = Topic.find(2)
    topic.slug = nil
    assert_equal(TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id], topic.to_param)
  end

  test "friendly database slug filters out #3 title" do
    topic = Topic.find(3)
    topic.slug = nil
    assert_equal(TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id], topic.to_param)
  end

  test "friendly database slug filters out #4 title" do
    topic = Topic.find(4)
    topic.slug = nil
    assert_equal(TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id], topic.to_param)
  end

  test "friendly database slug filters out a new topic title" do
    topic = Topic.create!(title: "Baby This Is a New Topic")
    assert_equal(topic.to_param, "baby-this-is-a-new-topic")

    topic.update(title: "My Newly Updated Title -")
    assert_equal(topic.to_param, "my-newly-updated-title")

    topic.update(title: "My Newly Updated Title--")
    assert_equal(topic.to_param, "my-newly-updated-title")
  end
end
