require 'rails_helper'

describe "editing a question after it has been posited" do
  it 'will edit a question' do
    question = FactoryGirl.create(:question)
    visit edit_question_path(question)
    fill_in 'Content', :with => 'So, I\'m confused. What exactly is science? Be specific.'
    click_on 'Update Question'
    expect(page).to have_content 'updated'
  end

  it "will not update a question if a field is blank" do
    question = FactoryGirl.create(:question)
    visit edit_question_path(question)
    fill_in 'Title', :with => ''
    click_on 'Update Question'
    expect(page).to have_content 'completely failed'
  end

  it "will delete question when the delete link is clicked" do
    question = FactoryGirl.create(:question)
    visit edit_question_path(question)
    click_on 'Delete question'
    expect(page).to have_no_content question
  end
end

describe "only let users edit their own questions" do
  it "will show Edit Question if signed in" do
    question = FactoryGirl.create(:question)
    sign_in(question.user)
    visit question_path(question)
    expect(page).to have_content "Edit Question"
  end

  it "will not show Edit Question if not user's question" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    visit question_path(question)
    expect(page).to have_no_content "Edit Question"
  end

end
