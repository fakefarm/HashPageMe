require "test_helper"

feature "On the home page" do
  should 'Have a proper greeting' do
    visit root_path
    page.must_have_content "HashPage"
    page.must_have_selector("input[placeholder='enter a username']")
    page.must_have_button('get tweets')
  end
end

feature 'getting the tweets' do
  should 'get to a show page' do
    VCR.use_cassette("catmathdo_handle") do
      visit root_path
      page.fill_in 'fetcher_username', :with => 'catmathdo'
      click_button "get tweets"
      page.must_have_content "catmathdo has 71 tweets!"
    end
    # _dw Question - how do I mock out this call to twitter? Or, is the point not to? Why isn't VCR working?
  end
end
