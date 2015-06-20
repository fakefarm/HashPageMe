class CustomHashtagPresenter
  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def custom_tweets(tag='')
    # _dw - this regex needs work!
    # Tom
    tw = tweets.select do |t|
      t.hashtags =~ /h,/ || t.hashtags =~ /b/ #b is temporary since it was my old test for 'banner'
    end
    tw.select { |t| t.hashtags.include?(tag) }
  end

  def hashtags
    tw = tweets.select do |t|
      t.hashtags =~ /h,/
    end
    tags = tw.map do |t|
      t.hashtags.split(',')[1].strip
    end
    tags.uniq - ['h']
  end
end

