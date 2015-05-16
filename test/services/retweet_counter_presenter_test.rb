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

end

## pass a list of tweets
# Returns a list of most retweeted tweets
# Option allows to pick 10, 20, 30 to return
# Option allows you to pick minimum retweets

