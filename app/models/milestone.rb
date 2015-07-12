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
#

class Milestone < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :parent_milestone, class_name: "Milestone", foreign_key: "milestone_id"
  has_many :child_milestones, class_name: "Milestone"

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


end
