class RetweetCounterPresenter

  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def list
    tweets.select { |tweet| tweet.retweet_count > 1 }
  end
end
