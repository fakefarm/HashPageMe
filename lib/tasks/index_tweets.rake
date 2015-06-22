namespace :twitter do
  desc 'Get some tweets from a user'
  task :get, [:username] => [:environment] do |t, args| #t stands for the task itself.
    # include RawTweetScrubber
    client  = TwitterClientWrapper.new
    # 605412578001620992
    tweets  = client.get_all_tweets(args[:username])

    tweets.each do |t|
      TwitterImporter.new(t).import!
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
