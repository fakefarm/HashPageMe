namespace :twitter do
  desc 'Get some tweets from a user'
  task :get, [:username] => [:environment] do |t, args| #t stands for the task itself.
    # get all latest tweets
    client  = TwitterClientWrapper.new
    tweets  = client.get_all_tweets(args[:username])
    # pp tweets.first.to_h
    banner = BannerPresenter.new(tweets).banner
    pp banner.to_h
    banner.save
  end
end
