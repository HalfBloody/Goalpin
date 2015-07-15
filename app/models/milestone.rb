# == Schema Information
#
# Table name: milestones
#
#  id           :integer          not null, primary key
#  challenge_id :integer
#  completed_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  milestone_id :integer
#  name         :string(255)
#  finish_until :datetime
#

class Milestone < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :parent_milestone, class_name: "Milestone", foreign_key: "milestone_id"
  has_many :sub_milestones, class_name: "Milestone"

  validates :days, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, 
  unless: "milestone_id.blank?"

  def self.complete(challenge_id)
    # If milestones are not predifined, this works
    # If milestones are predefined and ordered this won't work
    @milestone = self.new(challenge_id: challenge_id, completed_at: Time.now)
    if @milestone.save
      @milestone
    else
      false
    end
  end

  def days_planned
    if self.sub_milestones.empty?
      self.days
    else
      sub_milestones_days
    end
  end

  def sub_milestones_days
    self.sub_milestones.pluck(:days).reduce { |sum, days| (sum + days)  }
  end

  def sub_milestone_day_array

  end

end
