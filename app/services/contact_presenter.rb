class ContactPresenter
  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def contact_tweets(tag='')
    tw = tweets.select do |t|
      t.hashtags =~ /email/
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

