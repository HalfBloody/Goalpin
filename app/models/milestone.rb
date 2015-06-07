# == Schema Information
#
# Table name: milestones
#
#  id           :integer          not null, primary key
#  challenge_id :integer
#  completed_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Milestone < ActiveRecord::Base
  belongs_to :challenge

  def self.complete(challenge_id)
    @milestone = self.new(challenge_id: challenge_id, completed_at: Time.now)
    if @milestone.save
      @milestone
    else
      false
    end
  end

end
