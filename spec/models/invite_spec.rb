# == Schema Information
#
# Table name: invites
#
#  id           :integer          not null, primary key
#  mentor_id    :integer
#  created_at   :datetime
#  updated_at   :datetime
#  email        :string(255)
#  challenge_id :integer
#  token        :string(255)
#

require 'rails_helper'

RSpec.describe Invite, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
