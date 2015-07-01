class User

  attr_reader :username

  def initialize(username)
    @username = username
  end

  def about_tweets?
    # _dw HOMEWORK WRITE UNIT TESTS
    about_tweets.present?
  end

  def about_tweets
    @about_tweets ||= AboutKeyword.for_user(username)
  end
end
