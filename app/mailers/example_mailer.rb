class ExampleMailer < ApplicationMailer
  default from: "testingpurposes800@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

end
