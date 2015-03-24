require 'rails_helper'

describe 'the adding a question process' do
  it 'will add a question' do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on "Log In"
    visit questions_path
    click_on "Ask a question"
    fill_in 'Title', :with => 'What is physics?'
    fill_in 'Content', :with => 'I\'m SO CONFSED.'
    click_on 'Create Question'
    expect(page).to have_content 'posted'
  end

  it 'will alert the user if validation failed' do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on "Log In"
    visit new_question_path
    fill_in 'Title', :with => 'What is physics?'
    click_on 'Create Question'
    expect(page).to have_content 'failed'
  end

end
