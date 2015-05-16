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


  def time_progress
    [[(days_since_start.to_f / total_days.to_f), 1].min, 0].max
  end

  private
  def total_days
    ((self.end_date - self.start_date)/1.day).to_i
  end

  def days_since_start
    ((Time.now - self.start_date)/1.day).to_i
  end
end
