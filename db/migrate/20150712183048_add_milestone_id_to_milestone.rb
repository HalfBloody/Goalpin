class AddMilestoneIdToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :milestone_id, :integer
  end
end
