class Conversation
  def initialize(messages)
    @conversations = split_by_conversation(messages)
  end

end