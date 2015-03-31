require 'rails_helper'

describe "adding a user to the site" do
  it 'will add a user' do
    visit questions_path
    click_on "new user"
    fill_in 'Email', :with => 'lol@omg.com'
    fill_in 'Password', :with => '12345678'
    fill_in 'Password confirmation', :with => '12345678'
    click_on 'Sign up'
    expect(page).to have_content "Welcome Sarah James"
  end
end
