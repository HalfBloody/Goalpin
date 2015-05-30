class CreateChallengeSettings < ActiveRecord::Migration
  def change
    create_table :challenge_settings do |t|
      t.references :challenge, index: true
      t.boolean :daily_email
      t.boolean :weekly_email

      t.timestamps
    end
  end
end
