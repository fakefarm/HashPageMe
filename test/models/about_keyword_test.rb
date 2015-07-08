require 'test_helper'

class AboutKeywordTest < ActiveSupport::TestCase
  context "self.for_user" do

    should 'return an empty array if user has no tweets with hashtag' do
      assert_equal AboutKeyword.for_user('fake_user'), []
    end

    should 'return all tweets with about hashtag' do
      tweet = raw_tweets(:about)
      about_tweet = AboutKeyword.for_user(tweet.username)
      assert_equal 1, about_tweet.count
    end

    should 'return all tweets with aboutme hashtag' do
      tweet = raw_tweets(:aboutme)
      about_tweet = AboutKeyword.for_user(tweet.username)
      assert_equal 1, about_tweet.count
    end
  end
end

## Jon Daniel Notes

# PREFER OBJECTS OVER STRING
# code smell if you're passing in a string over passing an object.
# example:  Foo.user('dave')
# it's okay if it's string parsing kind of work
# but if it's not, better to pass a user object.

## Exceptions
# should occur when something happens that means that the rest of this processing
# from here on out can't go on.
# example
# user_profile(user)
# if username doesn't exist - Exception: record not found. (AR::RecordNotFound)
# working with exteral services - you will encounter an exception.
