class CreateRawTweets < ActiveRecord::Migration
  def change
    create_table :raw_tweets do |t|
      t.integer :tweet_id
      t.integer :user_id
      t.string :username
      t.string :hashtags
      t.string :text
      t.string :image

      t.timestamps
    end
  end
end
