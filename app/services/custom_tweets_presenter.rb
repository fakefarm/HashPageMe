class CustomTweetsPresenter
  attr_reader :tweets

  def self.hashtags(tweet) # _dw Why does this need to be class? How can I get it to be an object or helper method that is still in this class?
    tweet.split(',')[1]
  end

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

  def tweets_on_index_page
    all = hashtags.map do |h|
      RawTweet.hash_tags_newest_tweets(h)
    end
    all.map { |t| t.first }
  end
end
