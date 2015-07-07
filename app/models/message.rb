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

class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User"  
  belongs_to :recipient, class_name: "User"
  belongs_to :challenge

end
