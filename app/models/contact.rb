class Contact < ActiveRecord::Base
  def headers
  {
    :subject => "My Contact Form",
    :to => ENV["CONTACT_EMAIL"],
    :from => %("#{name}")
  }
end
end
