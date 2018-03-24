class ContactMailer < ActionMailer::Base
  default to: 'chaudhary.fsl@gmail.com'
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(from: email, subject: 'Beta Sign-up Form Message')
  end
end
