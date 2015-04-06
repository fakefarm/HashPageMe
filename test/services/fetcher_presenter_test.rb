require 'test_helper'

class FetcherPresenterTest < ActiveSupport::TestCase
  context "#get_all_tweets" do
    should 'return items passed into constructor' do
      p = FetcherPresenter.new(sample_tweets)
      assert_equal p.tweet_count, 2
    end
  end

  context "filter tweets" do
    should "return 90 day data" do
      p = FetcherPresenter.new([old_tweet, new_tweet])
      assert_equal p.show_90_day_data.first.id, new_tweet.id
      assert_not_equal p.show_90_day_data.last.id, old_tweet.id
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


# NOTES
# One approach to testing format
# context "post#create"
# context "get#show"
# context "get#index"
