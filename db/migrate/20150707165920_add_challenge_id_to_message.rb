class AddChallengeIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :challenge_id, :integer
  end
end
