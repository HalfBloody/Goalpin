class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.references :challenge, index: true
      t.datetime :completed_at

      t.timestamps
    end
  end
end
