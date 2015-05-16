# _dw Code Review
# presenters created in controller for use in view.
# doing things that don't belong in the model but don't want them to be helper methods. still want to be OO and test in iscolation.
# presnters should always be thin and to the point as possible.

class BannerPresenter
  include TweetParser # object methods
  # extend TweetParser would be class methods

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
    hash = banner.text.index('#') - 1 # Banner returns empty string when no #b. This is a good use of nil management.
    banner.text[0..hash]
    end
  end
end
