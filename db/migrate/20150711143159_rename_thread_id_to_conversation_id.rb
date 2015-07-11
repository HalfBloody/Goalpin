class RenameThreadIdToConversationId < ActiveRecord::Migration
  def change
    rename_column(:messages, :thread_id, :conversation_id)
  end
end
