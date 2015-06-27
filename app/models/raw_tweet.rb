class RawTweet < ActiveRecord::Base
  searchkick
  validates :tweet_id, uniqueness: true
end
