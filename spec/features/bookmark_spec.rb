require 'spec_helper'
require './models/link'
require 'database_cleaner'

RSpec.feature "link display", :type => :feature do
    # expect(page.status_code).to eq 200
    scenario "user is able to save a link" do
      Link.create(url: 'http://google.com', title: 'google')
      visit '/links'
      expect(page).to have_text('google')
    end
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
