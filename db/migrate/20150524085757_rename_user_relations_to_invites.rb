class RenameUserRelationsToInvites < ActiveRecord::Migration
  def change
    rename_table :user_relations, :invites
  end
end
