require "test_helper"

describe ContactMailer do
  it "contact_me" do
    mail = ContactMailer.contact_me
    mail.subject.must_equal "Contact me"
    mail.to.must_equal ["to@example.org"]
    mail.from.must_equal ["from@example.com"]
    mail.body.encoded.must_match "Hi"
  end
end
