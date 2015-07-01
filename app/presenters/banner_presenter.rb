# _dw move this into a keyword object format. meaning it looks for tweets that have the #b on them.
# Question - does that then become a presetner or something else?

# _jon - Keyword management
# 1. how should I manage keywords? Should they be their own presenters based on page, like about / contact, or banner for #b or depend on which.
# 2. would I call them something other than Presenter class Like class KeyWordAbout

class BannerPresenter

  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def banner
    tweet_with_proper_hashtag('b').first
  end

  def image
    # _dw feels like a lazy way to code. how can i remove the conditional at this stage.
    if banner.present? && banner.media.present?
      uri = banner.media.first.media_uri.request_uri
      host = banner.media.first.media_uri.host
      url = "http://" + host + uri
      url
    end
  end

  def text
    if banner.present?
    hash = banner.text.index('#') - 1 # Banner returns empty string when no #b. Is this a good use of nil management?
    banner.text[0..hash]
    end
  end

private

  def tweet_with_proper_hashtag(ht)
    tweets_with_hashtags.select { |t| does_this_tweet_have_right_hashtag?(ht, t) }
  end

  def tweets_with_hashtags
    tweets.select { |t| t.hashtags.count > 0 }
  end


  def does_this_tweet_have_right_hashtag?(ht, tweet)
    tweet.hashtags.select{ |t| t.text == ht }.present?
  end
end
