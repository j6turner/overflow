require 'rails_helper'

describe 'the adding a question process' do
  it 'will add a question' do
    visit questions_path
    click_on "Ask a question"
    fill_in 'Title', :with => 'What is physics?'
    fill_in 'Content', :with => 'I\'m SO CONFSED.'
    click_on 'Add Question'
    expect(page).to have_content 'posted'
  end

  it 'will alert the user if validation failed' do
    visit new_question_path
    fill_in 'Title', :with => 'What is physics?'
    click_on 'Add Question'
    expect(page).to have_content 'failed'
  end

end
