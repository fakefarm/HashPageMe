class AddTweetIdToRawTweet < ActiveRecord::Migration
  def change
    add_column :raw_tweets, :tweet_id, :bigint
    add_column :raw_tweets, :user_id, :bigint
  end
end
