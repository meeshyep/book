require "spec_helper"
require "database_cleaner"
require "./models/link"
require "./models/tag"

RSpec.feature "view tags", :type => :feature do
  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(tag_name: 'news')])
  end
  scenario "Filter links by tag" do
    visit '/links'
    fill_in :filter, with: 'news'
    click_button "Search"
    expect(page).to have_content('news')
  end
end
