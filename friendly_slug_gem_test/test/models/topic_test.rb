require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  Topic.all.each do |topic|
    test "friendly database slug filters out ##{topic.id} title" do
      assert_equal(topic.to_param, TestAnswers::TOPIC_ONE_PARAM_ANSWERS[topic.id])
    end
  end

  test "friendly database slug filters out a new topic title" do
    topic = Topic.create!(title: "Baby This Is a New Topic")
    assert_equal(topic.to_param, "baby-this-is-a-new-topic")
  end
end
