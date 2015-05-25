# == Schema Information
#
# Table name: invites
#
#  id           :integer          not null, primary key
#  invited_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#  email        :string(255)
#  challenge_id :integer
#

class Invite < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :invited, class_name: "User"

end

