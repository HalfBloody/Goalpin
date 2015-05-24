class AddChallengeIdToUserRelation < ActiveRecord::Migration
  def change
    add_column :user_relations, :challenge_id, :integer
  end
end
