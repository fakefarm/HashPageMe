class CreateRawTweets < ActiveRecord::Migration
  def change
    create_table :raw_tweets do |t|
      t.string :username
      t.string :hashtags
      t.string :text
      t.string :image

      t.timestamps
    end
  end
end
