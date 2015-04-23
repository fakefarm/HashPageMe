require "test_helper"

feature "fetchers#show" do
  should 'have a favorite and retweet tab' do
    visit root_path
    page.fill_in 'fetcher_username', :with => 'catmathdo'
    click_button "get tweets"
    page.must_have_content 'favorited by others'
    page.must_have_content 'retweeted by others'
    page.must_have_content 'trends'
    page.must_have_content '30 day stats'
    page.must_have_content 'catmathdo'
  end
end
