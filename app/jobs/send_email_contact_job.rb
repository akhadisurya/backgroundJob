class SendEmailContactJob < ActiveJob::Base
  queue_as :default

  def perform(contact)
    # Do something later
    @contact = contact
    ContactMailer.sample_contact(@contact).deliver_later
  end

end
