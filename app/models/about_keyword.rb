=begin
  DSL VISION
  class ContactKeyword
    keywords_for ["email", "phone", "phone_number"]

    # self.for_user
    # self.all
  end
=end

class AboutKeyword
  def self.for_user(username)
    tweets = RawTweet.where(username: username).where("hashtags LIKE '%about%' OR hashtags LIKE '%aboutme%'")
    # this sql is better than the writing a select statement
    # however, a LIKE and the way it's currently structure is inefficient when things start to scale. Read up on
    # LIKE Statement in sql
  end
end

