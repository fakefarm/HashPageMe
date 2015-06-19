require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'
require 'vcr_helper'
require 'pry'

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!

    # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def tweets
    # _dw HOMEWORK how to create these entity objects without the network.
    [
      # _dw HOMEWORK tweet(:with_banner_hashtag) _dw
      Twitter::Tweet.new(id: 1, entities: { hashtags: [ Twitter::Entity::Hashtag.new(text: 'b') ] })
    ]
  end

  def sample_tweets
    [
      Twitter::Tweet.new(id: 1, retweet_count: 2, retweeted_tweet?: false, hashtags: Twitter::Entity::Hashtag.new(text: 'foo')),
      Twitter::Tweet.new(id: 4, retweet_count: 5, retweeted_tweet?: false, hashtags: Twitter::Entity::Hashtag.new(text: 'foo')),
      Twitter::Tweet.new(id: 3, retweet_count: 5, retweeted_tweet?: true,  hashtags: Twitter::Entity::Hashtag.new(text: 'baz')),
      Twitter::Tweet.new(id: 2, retweet_count: 1, retweeted_tweet?: false, hashtags: Twitter::Entity::Hashtag.new(text: 'bar'))
    ]
  end
end
