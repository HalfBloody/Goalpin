class RenameChildIdToInvitedId < ActiveRecord::Migration
  def change
    rename_column :invites, :child_id, :invited_id
  end
end
