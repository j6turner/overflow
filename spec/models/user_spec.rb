require 'rails_helper'

describe User do
  it { should have_many :questions }
  it { should have_many :responses }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password}


  # it "sends an email when the user is created" do
  #   user = FactoryGirl.create(:user)
  #   ActionMailer::Base.deliveries.last.to.should eq [user.email]
  # end
end
