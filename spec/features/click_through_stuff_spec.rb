require 'rails_helper'

describe "link navigation" do

  it "will go to a question's page when you click on its title" do
    question = FactoryGirl.create(:question)
    sign_in(question.user)
    visit questions_path
    click_on question.title
    expect(page).to have_content question.content
  end

  it "will go to index page when you click on the header" do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    click_on "SCIENCE!"
    expect(page).to have_no_content question.content
  end

  it "will go to the edit page from a question's page" do
    question = FactoryGirl.create(:question)
    sign_in(question.user)
    visit question_path(question)
    click_on "Edit Question"
    expect(page).to have_content "Edit your question"
  end
end
