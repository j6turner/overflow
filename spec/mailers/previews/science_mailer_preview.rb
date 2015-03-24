# Preview all emails at http://localhost:3000/rails/mailers/science_mailer
class ScienceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/science_mailer/signup_confirmation
  def signup_confirmation
    ScienceMailer.signup_confirmation
  end

end
