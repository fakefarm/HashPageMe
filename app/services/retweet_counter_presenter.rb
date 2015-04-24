class RetweetCounterPresenter

  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def list
    tweets.select do |tweet|
      tweet.retweet_count > 0 && tweet.retweeted_tweet? == false
    end
  end

  # _dw todo - move this to HashTagsPresenter
  def hashes
    raw = tweets.select do |tweet|
      tweet.hashtags? == true && tweet.retweeted_tweet? == false
    end
    raw.map { |tweet| tweet.hashtags }.flatten.map { |tag| tag.attrs[:text].downcase }.uniq
  end
end
