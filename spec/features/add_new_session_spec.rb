require 'rails_helper'

describe "to log in an existing user" do
  it "will login in a user" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on "Log In"
    expect(page).to have_content user.name
  end
end
