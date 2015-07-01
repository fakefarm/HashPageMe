require 'test_helper'

class BannerPresenterTest < ActiveSupport::TestCase
  context "#banner" do
    should 'return the banner' do
      p = BannerPresenter.new(tweets).banner
      assert_equal p.id, 1
    end

    should 'return newest tweet banner' do
    end

    should 'handle when a tweet does not have a b tag' do
    end

    should 'handle when a b tweet does not have an image' do
    end
  end
end


