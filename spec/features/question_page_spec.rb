require 'rails_helper'

describe "adding a response to a question" do
  it 'will add a response to the question posed' do
    question = FactoryGirl.create(:question)
    sign_in(question.user)
    visit question_path(question)
    fill_in 'Content', :with => 'It\'s like magic.'
    click_on "Add Response"
    expect(page).to have_content 'Your response has been posted.'
  end

    it 'will alert user if response failed' do
      question = FactoryGirl.create(:question)
      sign_in(question.user)
      visit question_path(question)
      click_on "Add Response"
      expect(page).to have_content 'You have failed to complete this form.'
    end
end

describe "deleting a response to a question" do
  it "will delete a response" do
    question = FactoryGirl.create(:question)
    response = FactoryGirl.create(:response)
    sign_in(response.user)
    visit question_path(question)
    add_response(response)
    click_on "Delete Response"
    expect(page).to have_no_content response
  end

  it "will only let a user delete their own response" do
    user = FactoryGirl.create(:user)
    user.update(id: 2)
    user2 = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    response = FactoryGirl.create(:response)
    response.update(user_id: 2)
    sign_in(user)
    visit question_path(question)
    expect(page).to have_no_content "Delete Response"
  end
end

describe "adding best response to a response" do
  it "will allow a user to give a best response to their question" do
    question = FactoryGirl.create(:question)
    response = FactoryGirl.create(:response)
    sign_in(question.user)
    visit question_path(question)
    add_response(response)
    click_on "best response"
    expect(page).to have_content "Winnnner!"
  end
end
