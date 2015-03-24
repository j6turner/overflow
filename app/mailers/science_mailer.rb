class ScienceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.science_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @greeting = "Hi"

    @user = user

    mail to: user.email, subject: "Signup confirmation", body: "Hi"
  end
end
