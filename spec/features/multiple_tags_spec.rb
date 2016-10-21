require "spec_helper"
require "database_cleaner"
require "./models/link"
require "./models/tag"

RSpec.feature "multiple tags", :type => :feature do

before(:each) do
Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(tag_name: 'education, coding, bootcamp')])
end
  scenario "tagging a link with multiple tags" do
    visit '/'
    expect(page).to have_text('education, coding, bootcamp')
  end
end
