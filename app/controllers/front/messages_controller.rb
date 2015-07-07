class Front::MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    redirect_to :back

  end

  def message_params
    params.require(:message).permit(:subject, :text, :challenge_id, :recipient_id, :sender_id)
  end
end
