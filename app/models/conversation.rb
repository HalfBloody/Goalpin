# == Schema Information
#
# Table name: conversations
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  challenge_id :integer
#

class Conversation < ActiveRecord::Base
  has_many :messages
  accepts_nested_attributes_for :messages
  belongs_to :challenge


    def newest_message
    messages.order("created_at DESC").first
  end
end
