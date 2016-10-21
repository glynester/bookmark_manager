require 'mailgun'

class SendRecoverLink

  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV["https://api:78174453da6354774d2a759cc102c798\@api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages"])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV["mailgun_domain_name"], {from: "bookmarkmanager@mail.com",
      to: user.email,
      subject: "reset your password",
      text: "click here to reset your password http://yourherokuapp.com/reset_password?token=#{user.password_token}" })
  end

  private
  attr_reader :mailer
end
