require 'spec_helper'
require './models/link'

RSpec.feature "link display", :type => :feature do
    # expect(page.status_code).to eq 200
    scenario "user is able to save a link" do
      Link.create( id: 2, url: 'http://google.com', title: 'google')
      visit '/links'
      expect(page).to have_text('http://google.com')
    end
end
