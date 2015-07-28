require 'test_helper'

class AboutKeywordTest < ActiveSupport::TestCase
  context "self.for_user" do

    should 'return an empty array if user has no tweets with hashtag' do
      assert_equal AboutKeyword.for_user('fake_user'), []
    end

    should 'return all tweets with about hashtag' do
      tweet = raw_tweets(:about)
      about_tweet = AboutKeyword.for_user(tweet.username)
      assert_equal 1, about_tweet.count
    end

    should 'return all tweets with aboutme hashtag' do
      tweet = raw_tweets(:aboutme)
      about_tweet = AboutKeyword.for_user(tweet.username)
      assert_equal 1, about_tweet.count
    end
  end
end
