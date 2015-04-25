require 'test_helper'

feature "#banner" do
  should 'have banner text from a tweet' do
    # _dw Question How do I do this? Is it by using a fixture?
    visit fetcher_path id: 2
    page.must_have_content '5 more days to do things!'
  end
end
