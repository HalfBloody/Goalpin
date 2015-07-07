# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  sender_id    :integer
#  recipient_id :integer
#  subject      :string(255)
#  text         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  challenge_id :integer
#

FactoryGirl.define do
  factory :message do
    sender_id 1
recepient_id 1
subject "MyString"
text "MyString"
  end

end
