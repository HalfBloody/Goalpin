class AddFinishUntilToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :finish_until, :datetime
  end
end
