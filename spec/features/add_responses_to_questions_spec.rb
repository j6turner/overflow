require 'rails_helper'

  describe "adding a response to a question" do
    it 'will add a response to the question posed' do
      question = FactoryGirl.create(:question)
      visit question_path(question)
      fill_in 'Content', :with => 'It\'s like magic.'
      click_on "Add Response"
      expect(page).to have_content 'Your response has been posted.'
  end

    it 'will alert user if response failed' do
      question = FactoryGirl.create(:question)
      visit question_path(question)
      click_on "Add Response"
      expect(page).to have_content 'You have failed to complete this form.'
    end
end
