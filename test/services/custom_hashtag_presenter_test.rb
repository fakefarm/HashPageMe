require 'test_helper'

class CustomHashtagPresenterTest < ActiveSupport::TestCase
  context "#h" do
    before do
      @tweets = [raw_tweets(:custom_one), raw_tweets(:custom_two), raw_tweets(:basic)]
    end

    should 'return all tweets with h tag' do
      the_tweets = CustomHashtagPresenter.new(@tweets)
      assert_equal the_tweets.custom_tweets.count, 2
    end
  end

  context '#hashtags' do
    should 'return just list of custom hashtags' do
      hash_tags = CustomHashtagPresenter.new(@tweets).hashtags
      assert_equal hash_tags.first.hashtags.include?('think'), true
    end
  end
end
