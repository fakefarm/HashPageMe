require "test_helper"

feature "On the home page" do
  should 'Have a proper greeting' do
    visit root_path
    page.must_have_content "HashPage"
    page.wont_have_content "Goobye All!"
  end
end
