class User

  attr_reader :username

  def initialize(username)
    @username = username
  end

  def about_tweets?
    about_tweets.present?
  end

  def about_tweets
    @about_tweets ||= AboutKeyword.for_user(username)
  end
end
