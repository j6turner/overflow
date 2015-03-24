require "rails_helper"

RSpec.describe ScienceMailer, type: :mailer do
  describe "signup_confirmation" do
    user = FactoryGirl.create(:user)
    let(:mail) { ScienceMailer.signup_confirmation(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Signup confirmation")
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
