# Controls email from the 'contact me' section
class ContactMailer < ActionMailer::Base
  default from: 'contactme@matt-schneider.com'

  def contact_me(message)
    @message = message
    mail to: 'matts3@u.washington.edu', subject: 'matt-schneider.com Contact
                                                  Message'
  end
end
