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
end

