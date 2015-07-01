require 'test_helper'

class AboutPresenterTest < ActiveSupport::TestCase
  context "#aboutMe" do
    before do
      @tweets = [raw_tweets(:custom_one), raw_tweets(:custom_two), raw_tweets(:about)]
    end

    should 'return all tweets with #aboutMe or #about hashtag' do
      the_tweets = AboutPresenter.new(@tweets)
      assert_equal the_tweets.about_tweets.count, 1
    end
  end
end
