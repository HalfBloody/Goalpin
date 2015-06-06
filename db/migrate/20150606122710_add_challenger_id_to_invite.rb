class AddChallengerIdToInvite < ActiveRecord::Migration
  def change
    add_column :invites, :challenger_id, :integer
  end
end
