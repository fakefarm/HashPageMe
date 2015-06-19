class CustomHashtagPresenter
  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def custom_tweets
    # _dw - this regex needs work!
    # Tom
    tweets.select { |t|  t.hashtags =~ /h,/ }
  end
end
