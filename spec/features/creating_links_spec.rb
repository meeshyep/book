require 'spec_helper'
require './models/link'

feature 'add new links to website', :type => feature do
  scenario "adds links" do
    visit '/new'
    fill_in "title", with: 'this is google'
    fill_in 'url', with: 'http://www.google.com'
    click_button "Create link"
    expect(current_path).to eq '/links'
    # within 'ul#links' do
      expect(page).to have_text('this is google')
    # end
  end
end
