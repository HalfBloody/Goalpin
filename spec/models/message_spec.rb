# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  sender_id    :integer
#  recepient_id :integer
#  subject      :string(255)
#  text         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  challenge_id :integer
#

require 'rails_helper'

RSpec.describe Message, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
