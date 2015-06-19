class CustomHashtagPresenter
  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def custom_tweets
    # _dw - this regex needs work!
    # Tom
    tw = tweets.select do |t|
      t.hashtags =~ /h,/ || t.hashtags =~ /b/ #b is temporary since it was my old test for 'banner'
    end
  end
end

