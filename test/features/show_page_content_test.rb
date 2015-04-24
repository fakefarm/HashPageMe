require "test_helper"

# feature "fetchers#show" do
#   should 'have a favorite and retweet tab' do
#     # _dw hmm how do I use vcr?
#     VCR.use_cassette("catmathdo_handle") do
#       visit root_path
#       page.fill_in 'fetcher_username', :with => 'catmathdo'
#       click_button "get tweets"
#       page.must_have_content 'favorited by others'
#       page.must_have_content 'retweeted by others'
#       page.must_have_content 'trends'
#       page.must_have_content '30 day stats'
#       page.must_have_content 'catmathdo'
#     end
#   end
# end

feature "#banner" do
  should 'have an image' do
  end

  should 'have banner text from a tweet' do
    # _dw Question How do I do this? Is it by using a fixture?
    visit fetcher_path id: 2
    page.must_have_content '5 more days to do things!'
  end
end
