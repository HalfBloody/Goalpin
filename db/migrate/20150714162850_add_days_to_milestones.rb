class AddDaysToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :days, :integer
  end
end
