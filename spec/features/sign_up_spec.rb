require 'spec_helper'

feature 'create a user account', :type => feature do
  before(:each) do
  Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(tag_name: 'education, coding, bootcamp')])
  end
  scenario "user account correctly created" do
    user = User.new("myemail@email.com", "password")
    visit '/'
    click_button "Login"
    expect(current_path).to eq '/login'
    expect{user.increment}.to change{user.count}.by(1)
  end
end
