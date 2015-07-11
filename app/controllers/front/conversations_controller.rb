class Front::ConversationsController < ApplicationController

  def create
    @conversation = Conversation.create(conversation_params)
    redirect_to :back, message: "Conversation successfully created"
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:challenge_id, messages_attributes: [:sender_id, :recipient_id, :subject, :text, :conversation_id] )
  end
end
