namespace :twitter do
  desc 'Get some tweets from a user'
  task :get, [:username] => [:environment] do |t, args| #t stands for the task itself.
    include RawTweetScrubber
    client  = TwitterClientWrapper.new
    tweets  = client.get_all_tweets(args[:username])
    # banner = BannerPresenter.new(tweets).banner


    tweets.each do |t|
      RawTweet.create( tweet_id: t.id,
                       user_id: t.user.id,
                       hashtags: hashtags(t),
                       text: t.text,
                       image: image_url(t)
                      )
    end

    raw_tweet_count = RawTweet.where(user_id: tweets.first.user.id).count

    puts "#{raw_tweet_count} raw tweets imported for #{args[:username]}!"
  end
end
