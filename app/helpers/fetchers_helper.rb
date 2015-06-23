module FetchersHelper
class Greeter # PRESENTER greeter_presenter pass user to greeter so instead of logic in view, logic is in greeter
end

  def greeting
    Greeter.new(@fetcher.username).greeting # _dw JON - what was this again?
    "Good Afternoon, FOO"
  end

  def only_text(tweet)
     tweet[0.. tweet.index('#') -1].chop
  end

  def tweet_path(tweet)
    "http://www.twitter.com/#{tweet.username}/status/#{tweet.tweet_id}"
  end
end
