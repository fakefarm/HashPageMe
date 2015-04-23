require 'test_helper'

class RetweetCounterPresenterTest < ActiveSupport::TestCase
  context "#list" do
    should 'return a list of tweets that have at least 2 retweets' do
      tweets = sample_tweets
      rcp = RetweetCounterPresenter.new(tweets).list
      assert_equal 1, rcp.count
    end
  end

private

  def sample_tweets
    [ Twitter::Tweet.new(id: 1, retweet_count: 2), Twitter::Tweet.new(id: 2, retweet_count: 1) ]
  end
end

## pass a list of tweets
# Returns a list of most retweeted tweets
# Option allows to pick 10, 20, 30 to return
# Option allows you to pick minimum retweets
