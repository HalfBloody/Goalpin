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

FactoryGirl.define do
  factory :milestone do
    challenge nil
completed_at ""
  end

end
