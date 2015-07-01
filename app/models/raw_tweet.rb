class RawTweet < ActiveRecord::Base
  searchkick
  validates :tweet_id, uniqueness: true

  # NOTES on Scopes.
  # usually scopes return relations.
  # _dw TODO - Study up on best time & place to use scopes..

  scope :hash_tags_newest_tweets, ->(h) { where("hashtags like ?", "%#{h}%").order("created_at desc") }

  def self.newest_tweet_image(h)
    hash_tags_newest_tweets(h).where("image is not null").first
  end
end
