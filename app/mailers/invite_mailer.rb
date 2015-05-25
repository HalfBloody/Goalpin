class InviteMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite_email(invite)
    @invite = invite
    @url ='http://localhost:3000'
    mail(to: @invite.email, subject: 'Help me finish my challenge')
  end
end
