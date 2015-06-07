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

FactoryGirl.define do
  factory :challenge_setting do
    challenge nil
daily_email false
weekly_email false
  end

end
