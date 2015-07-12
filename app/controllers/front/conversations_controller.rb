class Front::ConversationsController < ApplicationController

  def create
    @conversation = Conversation.create(conversation_params)
    redirect_to :back, message: "Conversation successfully created"
  end

  def update
    @conversation = Conversation.find(params[:id])
    if params[:messages_attributes]
      @message = Message.create(
      sender_id: conversation_params[:messages_attributes][:sender_id],
      recipient_id: conversation_params[:messages_attributes][:recipient_id],
      sender_id: conversation_params[:messages_attributes][:sender_id],
      subject: conversation_params[:messages_attributes][:subject],
      text: conversation_params[:messages_attributes][:text],
      conversation_id: conversation_params[:messages_attributes][:conversation_id]
        )
    end
    @conversation.update_attributes(conversation_params)
    redirect_to :back
  end

  def show
    @conversation = Conversation.find(params[:id])
    @challenge = @conversation.challenge
    @conversation2 = Conversation.find(params[:id])

    @conversation.messages.build

  end

  def conversation_params
    params.require(:conversation).permit(:challenge_id, messages_attributes: [:sender_id, :recipient_id, :subject, :text, :conversation_id] )
  end
end
