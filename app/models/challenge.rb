# == Schema Information
#
# Table name: challenges
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  typus                :string(255)
#  start_date           :datetime
#  end_date             :datetime
#  number_of_milestones :integer
#  finished_milestones  :integer
#  facebook             :boolean
#  created_at           :datetime
#  updated_at           :datetime
#

class Challenge < ActiveRecord::Base
  belongs_to :user
  has_many :invites
  has_many :mentors, through: :invites
  has_one :challenge_setting
  has_many :milestones

  before_create :reset_milestones


  def time_progress
    ([[(days_since_start.to_f / total_days.to_f), 1].min, 0].max * 100)
  end

  def milestone_progress
    ([[(finished_milestones.to_f / number_of_milestones.to_f), 1].min, 0].max * 100)
  end

  def behind_schedule?
    self.time_progress > milestone_progress
  end

  def reset_milestones
    self.finished_milestones = 0
  end

  def complete_milestone
    Milestone.complete(self.id)
  end

  private
  def total_days
    ((self.end_date - self.start_date)/1.day).to_i
  end

  def days_since_start
    ((Time.now - self.start_date)/1.day).to_i
  end
end
