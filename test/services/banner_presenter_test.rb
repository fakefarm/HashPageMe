require 'test_helper'

class BannerPresenterTest < ActiveSupport::TestCase
  context "#banner" do
    should 'return the banner' do
      p = BannerPresenter.new(tweets).banner
      assert_equal p.id, 1
    end

    should 'return newest tweet banner' do
    end

    should 'handle when a tweet does not have a b tag' do
    end

    should 'handle when a b tweet does not have an image' do
    end
  end

private

  # _dw Question
  # I copy / pasted this from fetcher presenter. what's better way to manage data?
  def tweets
    [
      Twitter::Tweet.new(id: 1, retweet_count: 2, retweeted_tweet?: false, hashtags: Twitter::Entity::Hashtag.new(text: 'b')),
      Twitter::Tweet.new(id: 4, retweet_count: 5, retweeted_tweet?: false, hashtags: Twitter::Entity::Hashtag.new(text: 'foo')),
      Twitter::Tweet.new(id: 3, retweet_count: 5, retweeted_tweet?: true,  hashtags: Twitter::Entity::Hashtag.new(text: 'baz')),
      Twitter::Tweet.new(id: 2, retweet_count: 1, retweeted_tweet?: false, hashtags: Twitter::Entity::Hashtag.new(text: 'bar'))
    ]
  end
end
