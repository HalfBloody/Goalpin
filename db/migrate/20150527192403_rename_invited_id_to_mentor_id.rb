class RenameInvitedIdToMentorId < ActiveRecord::Migration
  def change
    rename_column :invites, :invited_id, :mentor_id
  end
end
