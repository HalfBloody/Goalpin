# == Schema Information
#
# Table name: challenge_settings
#
#  id           :integer          not null, primary key
#  challenge_id :integer
#  daily_email  :boolean
#  weekly_email :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

class ChallengeSetting < ActiveRecord::Base
  belongs_to :challenge

  validates :challenge_id, presence: true
  
  
end
