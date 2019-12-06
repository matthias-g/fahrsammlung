class PrefixEmailSubject
  def self.delivering_email(mail)
    mail.subject = "[Fahrsammlung] " + mail.subject
  end
end
ActionMailer::Base.register_interceptor(PrefixEmailSubject)
