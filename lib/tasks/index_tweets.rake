namespace :twitter do
  desc 'Get some tweets from a user'
  task :get, [:username] => [:environment] do |t, args| #t stands for the task itself.
    include RawTweetScrubber
    client  = TwitterClientWrapper.new
    # 605412578001620992
    # tweets  = client.get_all_tweets(args[:username])
    tweets  = client.get_all_tweets('wwwoodall')
    tweets.each do |t|
      RawTweet.create( tweet_id: t.id,
                       user_id: t.user.id,
                       username: t.user.screen_name,
                       hashtags: hashtags(t),
                       text: t.text,
                       image: image_url(t)
                      )
    end

    raw_tweet_count = RawTweet.where(user_id: tweets.first.user.id).count

    puts "#{raw_tweet_count} raw tweets imported for #{args[:username]}!"
  end

  desc 'Polish tweets for hashpage'
  task :polish, [:username] => [:environment] do |t, args|
    tweets = RawTweet.where(username: args[:username])
    custom_tweets = CustomHashtagPresenter.new(tweets).custom_tweets
  end
end
