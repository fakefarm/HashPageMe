class TwitterClientWrapper
  attr_reader :client

  def initialize
    @client = make_client
  end

  def get_all_tweets(user)
    client.user_timeline(user, :count => 3200) # munge it
  end

private
  # basic connections
  def make_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Figaro.env.twitter_consumer_key
      config.consumer_secret     = Figaro.env.twitter_consumer_secret
      config.access_token        = Figaro.env.twitter_access_token
      config.access_token_secret = Figaro.env.twitter_access_token_secret
    end
  end
end

# NOTES
# when working with external services, have a single class that wraps the few methods
# separating into multiple files is probably over complicating it.

## On hitting a private method
# TwitterClientWrapper does not have access to Twitter::REST::Client's private methods. (#collect_with_max_id)
# Private method error is a red flag that i'm out of bounds.
# When i hit a private method, i should wonder if i'm too 'deep' and look for a public api method.
# this gem should provide some public methods, like 'get user tweets'
