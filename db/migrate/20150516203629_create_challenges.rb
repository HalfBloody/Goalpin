class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.references :user, index: true
      t.string :typus
      t.datetime :start_date
      t.datetime :end_date
      t.integer :number_of_milestones
      t.integer :finished_milestones
      t.boolean :facebook

      t.timestamps
    end
  end
end
