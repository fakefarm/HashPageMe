class TweetParser
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
