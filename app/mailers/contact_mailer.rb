class ContactMailer < ApplicationMailer
  default from: "testingpurposes800@gmail.com"

  def sample_contact(contact)
    @contact = contact
    mail(to: "testingpurposes800@gmail.com", subject: 'Message')
  end

end
