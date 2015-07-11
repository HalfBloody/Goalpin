class AddChallengeIdToConversation < ActiveRecord::Migration
  def change
    add_column(:conversations, :challenge_id, :integer)
  end
end
