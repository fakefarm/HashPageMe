class CustomTweetsPresenter < BasePresenter
  attr_reader :tweets

  def self.hashtags(tweet) # _jon Why does this need to be class? How can I get it to be an object or helper method that is still in this class?
    tweet.split(',')[1]
  end



  def initialize(tweets)
    @tweets = tweets
  end

  def custom_tweets(tag='')
    # _dw - this regex needs work!
    # _tom
    tw = tweets.select do |t|
      t.hashtags =~ /h,/ || t.hashtags =~ /b/ #b is temporary since it was my old test for 'banner'
    end
    tw.select { |t| t.hashtags.include?(tag) }
  end

  def lastest_tweet_per_hashtag
    all = hashtags.map do |h|
      RawTweet.hash_tags_newest_tweets(h)
    end
    all.map { |t| t.first }
  end
end
