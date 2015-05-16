require 'test_helper'

class FetcherPresenterTest < ActiveSupport::TestCase
  context "#tweet_count" do
    should 'return items passed into constructor' do
      p = FetcherPresenter.new(sample_tweets)
      assert_equal p.tweet_count, 2
    end
  end

private

  def sample_tweets
    [ Twitter::Tweet.new(id: 1), Twitter::Tweet.new(id: 2) ]
  end

  def new_tweet
    Twitter::Tweet.new(id: 1, created_at: "2015-02-10 14:44:24")
  end

  def old_tweet
    Twitter::Tweet.new(id: 2, created_at: "2014-09-10 14:44:24")
  end
end
