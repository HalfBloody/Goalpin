class RenameChallengerIdToInviterId < ActiveRecord::Migration
  def change
    rename_column :invites, :challenger_id, :inviter_id
  end
end
