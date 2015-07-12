class Front::MessagesController < ApplicationController
  def create
    if message_params[:conversation_id]
      @challenge = Conversation.find(message_params[:conversation_id])
    else
      
    end
    @message = Message.create(message_params)
    MessageMailer.message_notification(@message).deliver
    redirect_to :back

  end

  def show
    
  end

  def new
    
  end

  def message_params
    params.require(:message).permit(:subject, :text, :conversation_id, :recipient_id, :sender_id)
  end
end
