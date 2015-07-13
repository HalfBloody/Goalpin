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
#

FactoryGirl.define do
  factory :milestone do
    challenge nil
completed_at ""
  end

end
