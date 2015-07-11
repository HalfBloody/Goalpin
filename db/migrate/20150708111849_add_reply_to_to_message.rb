class AddReplyToToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :reply_to, :integer
  end
end
