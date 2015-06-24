require 'test_helper'

class ContactPresenterTest < ActiveSupport::TestCase
  context "#email" do
    before do
      @tweets = [raw_tweets(:custom_one), raw_tweets(:custom_two), raw_tweets(:contact)]
    end

    should 'return all tweets with #email' do
      the_tweets = ContactPresenter.new(@tweets)
      assert_equal the_tweets.contact_tweets.count, 1
    end
  end
end
