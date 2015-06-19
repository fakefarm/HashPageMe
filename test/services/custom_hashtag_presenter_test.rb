require 'test_helper'

class CustomHashtagPresenterTest < ActiveSupport::TestCase
  context "#h" do
    should 'return all tweets with h tag' do
      tweets = [raw_tweets(:custom_one), raw_tweets(:custom_two), raw_tweets(:basic)]
      the_tweets = CustomHashtagPresenter.new(tweets)
      assert_equal the_tweets.custom_tweets.count, 2
    end
  end
end
