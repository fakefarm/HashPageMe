class TwitterClientWrapper
  def self.client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Figaro.env.twitter_consumer_key
      config.consumer_secret     = Figaro.env.twitter_consumer_secret
      config.access_token        = Figaro.env.twitter_access_token
      config.access_token_secret = Figaro.env.twitter_access_token_secret
    end
    def client.get_all_tweets(user)
      collect_with_max_id do |max_id|
        options = {count: 200, include_rts: true}
        options[:max_id] = max_id unless max_id.nil?
        user_timeline(user, options)
      end
    end
    client
  end
end
