class MessageMailer < ActionMailer::Base
  default from: "from@example.com"

  def message_notification(message)
    @message = message
    @url = 'http://localhost:3000'
    mail(to: message.recipient.email, subject: "#{message.sender.email} says: #{message.subject}" )
  end
end
