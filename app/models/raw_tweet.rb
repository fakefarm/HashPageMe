class RawTweet < ActiveRecord::Base
  searchkick
  validates :tweet_id, uniqueness: true

  # NOTES usually scopes return relations.
  # _dw notes.

  scope :hash_tags_newest_tweets, ->(h) { where("hashtags like ?", "%#{h}%").order("created_at desc") }
  # scope :newest_tweet_image, ->(h) { hash_tags_newest_tweets(h).where("image is not null").first }

  # def self.newest_tweet_image(h)
  #   hash_tags_newest_tweets(h).where("image is not null").first
  # end

  # scope :first_image
  # def first_image(tweet)
  # end
end
