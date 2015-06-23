class AboutPresenter
  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def about_tweets(tag='')
    tw = tweets.select do |t|
      t.hashtags =~ /about/ || t.hashtags =~ /aboutme/ #b is temporary since it was my old test for 'banner'
    end
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

