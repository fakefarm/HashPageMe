module FetchersHelper
  def only_text(tweet)
     tweet[0.. tweet.index('#') -1].chop
  end

  def tweet_path(tweet)
    "http://www.twitter.com/#{tweet.username}/status/#{tweet.tweet_id}"
  end
end
