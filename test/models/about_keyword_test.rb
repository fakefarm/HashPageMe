require 'test_helper'

class AboutKeyword < ActiveSupport::TestCase
  context "#for_user" do
    should 'return all tweets with #aboutMe or #about hashtag' do
      # User.any_instance.stubs(:about_tweets).returns(raw_tweets(:about))

      # RawTweet.stubs(:where).returns(raw_tweets(:about))
      # about_tweets = AboutKeyword.new('dave')
      # assert_equal 1, about_tweets

      RawTweet.stub :where, raw_tweets(:about) do   # stub goes away once the block is done
        about_tweets = AboutKeyword.new('dave')
        assert_equal 1, about_tweets
      end
    end
  end
end
