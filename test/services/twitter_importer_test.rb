# _tom How would I write tests for this?
# goal: make sure what i get from gem and what I need are correct.
# 1. translate b/n gem and schema
# 2. that these methods work.

require 'test_helper'

class TwitterImporterTest < ActiveSupport::TestCase

  context '#import!' do
    should 'create a new RawTweet' do
      assert_difference "RawTweet.count" do
        TwitterImporter.new({}).import!
      end
    end

    should 'parse out the image url' do
      # 2 tests - with and without image url
    end

    should 'does not have hashtags' do
      # 2 tests -  with and without hashtags
    end
  end

  private

  def sample_tweet(options={})
    # _dw HOMEWORK
    # openstruct
    # t = Twitter::Tweet.new({id: 123}.merge(options))
  end
end
