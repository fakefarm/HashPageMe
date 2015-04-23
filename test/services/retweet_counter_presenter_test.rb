require 'test_helper'

class RetweetCounterPresenterTest < ActiveSupport::TestCase
  context "#list" do
    should 'return a list of tweets that have at least 2 retweets' do
      tweets = sample_tweets
      rcp = RetweetCounterPresenter.new(tweets).list
      # _dw why is this not cooperating?
      assert_equal 2, rcp.count
    end
  end

  context '#hashes' do
    should 'return a list of most used hash tags' do
      # _dw can't figure out how to mock this one
      Twitter::Tweet.stub(:hashtags?, true) do
        tweets = sample_tweets
        rcp = RetweetCounterPresenter.new(tweets).hashes
        assert_equal 3, rcp.count
      end
    end
  end

private

  def sample_tweets
    [
      Twitter::Tweet.new(id: 1, retweet_count: 2, retweeted_tweet?: false, hashtags: Twitter::Entity::Hashtag.new(text: 'foo')),
      Twitter::Tweet.new(id: 4, retweet_count: 5, retweeted_tweet?: false, hashtags: Twitter::Entity::Hashtag.new(text: 'foo')),
      Twitter::Tweet.new(id: 3, retweet_count: 5, retweeted_tweet?: true,  hashtags: Twitter::Entity::Hashtag.new(text: 'baz')),
      Twitter::Tweet.new(id: 2, retweet_count: 1, retweeted_tweet?: false, hashtags: Twitter::Entity::Hashtag.new(text: 'bar'))
    ]
  end
end

## pass a list of tweets
# Returns a list of most retweeted tweets
# Option allows to pick 10, 20, 30 to return
# Option allows you to pick minimum retweets

