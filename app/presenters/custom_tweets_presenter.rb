class CustomTweetsPresenter

  def self.hashtags(tweet) # _jon Why does this need to be class? How can I get it to be an object or helper method that is still in this class?
    tweet.split(',')[1]
  end


  def initialize(tweets, theme)
    @raw_tweets = tweets
    @theme = theme
  end

  def tweets(tag='')
    # picks tweets based on theme selected.
    # produce only tweets with #vacation
    @theme.filter(raw_tweets)
  end

  def lastest_tweet_per_hashtag
    all = hashtags.map do |h|
      RawTweet.hash_tags_newest_tweets(h)
    end
    all.map { |t| t.first }
  end

  def decoration
    THEMES[@theme].new.decoration_image
  end

private

  def all_tweets
    tw = @raw_tweets.select do |t|
      (t.hashtags =~ /h,/ || t.hashtags =~ /b/) && t.hashtags.include?(tag)
    end.shuffle
    #tw.select { |t| t.hashtags.include?(tag) }.shuffle
    # add the && when i see the double use of the method - move it
  end

  def vacation_tweets
    # filter guts
  end


  class DefaultTheme
    def filter(tweets)
    end

    def decoration_image
      "foobar.jpg"
    end
  end
end

