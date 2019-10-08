ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'database_cleaner'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all
end

class ActionDispatch::IntegrationTest
  DatabaseCleaner.strategy = :truncation
end

module TestAnswers
  ONE_PARAM_ANSWERS = [
    "",
    "1",
    "2",
    "3",
  ]

  TWO_PARAM_ANSWERS = [
    "",
    "this-is-the-greatest-post-23_-asf-1",
    "just-a-normal-for-15-test-string-2",
    "just-george-normal-for-15-test-string-3",
  ]

  COMMENT_PARAM_ANSWERS = [
    "",
    "1-this-is-the-greatest-post-23_-asf",
    "2-just-a-normal-for-15-test-string",
    "3-just-george-normal-for-15-test-string",
  ]

  TOPIC_ONE_PARAM_ANSWERS = [
    "",
    "my-string",
    "my-string-2",
    "mystring3",
    "my-string-4",
  ]
end
