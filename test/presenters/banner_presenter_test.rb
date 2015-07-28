require 'test_helper'

class BannerPresenterTest < ActiveSupport::TestCase
  context "#banner" do
    should 'return the banner' do
      p = BannerPresenter.new(tweets).banner
      assert_equal p.id, 1
    end
  end
end


