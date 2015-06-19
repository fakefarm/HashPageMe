require "test_helper"

describe RawTweets do
  let(:raw_tweets) { RawTweets.new }

  it "must be valid" do
    raw_tweets.must_be :valid?
  end
end
