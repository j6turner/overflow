require 'rails_helper'

describe "adding a user to the site" do
  it 'will add a user' do
    visit questions_path
    click_on "New user"
    fill_in 'Name', :with => 'Sarah James'
    fill_in 'Email', :with => 'lol@omg.com'
    fill_in 'Password', :with => '1234'
    fill_in 'Password confirmation', :with => '1234'
    click_on 'Create User'
    expect(page).to have_content "Welcome Sarah James"
  end
end
