class CreateRawTweets < ActiveRecord::Migration
  def change
    create_table :raw_tweets do |t|
      t.text :blob
      t.integer :tweet_id
      t.integer :user_id
      t.string :hashtags
      t.string :text
      t.string :image

      t.timestamps
    end
  end
end
