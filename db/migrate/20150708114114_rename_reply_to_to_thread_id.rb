class RenameReplyToToThreadId < ActiveRecord::Migration
  def change
    rename_column(:messages, :reply_to, :thread_id)
  end
end
