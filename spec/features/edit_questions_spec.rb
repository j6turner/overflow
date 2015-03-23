require 'rails_helper'

  describe "editing a question after it has been posited" do
    it 'will edit a question' do
      question = FactoryGirl.create(:question)
      visit edit_question_path(question)
      fill_in 'Content', :with => 'So, I\'m confused. What exactly is science? Be specific.'
      click_on 'Update Question'
      expect(page).to have_content 'updated'
    end

end
