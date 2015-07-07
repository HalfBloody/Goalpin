class RenameRecepientToRecipient < ActiveRecord::Migration
  def change
    rename_column :messages, :recepient_id, :recipient_id
  end
end
