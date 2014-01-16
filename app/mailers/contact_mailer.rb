class ContactMailer < ActionMailer::Base
  default from: "contactme@matt-schneider.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_me.subject
  #
  def contact_me(message)
    @message = message
    mail to: "matts3@u.washington.edu", subject: "matt-schneider.com Contact Message"
  end
end
