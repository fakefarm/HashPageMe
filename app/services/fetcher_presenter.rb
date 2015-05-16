class FetcherPresenter

  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def tweet_count
    tweets.count # rather than calling @tweets... get a hook.
  end
end

# NOTES
# Why to use attr_reader :tweets?
# Could also have a private method called tweets to further manipulate b/c now I have a hook to get into.
# Example;
# def tweets
#   @tweets.reverse
# end
