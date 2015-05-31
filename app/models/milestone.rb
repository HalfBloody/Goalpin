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
