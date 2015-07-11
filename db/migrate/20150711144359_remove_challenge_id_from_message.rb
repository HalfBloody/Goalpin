class RemoveChallengeIdFromMessage < ActiveRecord::Migration
  def change
    remove_column(:messages, :challenge_id, :string)
  end
end
