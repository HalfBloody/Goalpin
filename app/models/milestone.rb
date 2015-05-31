class Milestone < ActiveRecord::Base
  belongs_to :challenge

  def self.complete(challenge_id)
    self.create(challenge_id: challenge_id, completed_at: Time.now)
  end

end
