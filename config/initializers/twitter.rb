class TwitterClientWrapper
  attr_reader :client

  def initialize
    @client = create_client
  end

  def get_all_tweets(user)
    client.user_timeline(user, :count => 3200) # munge it
  end

private
  # basic connections
  def create_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Figaro.env.twitter_consumer_key
      config.consumer_secret     = Figaro.env.twitter_consumer_secret
      config.access_token        = Figaro.env.twitter_access_token
      config.access_token_secret = Figaro.env.twitter_access_token_secret
    end
  end
end

