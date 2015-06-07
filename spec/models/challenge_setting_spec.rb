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

require 'rails_helper'

RSpec.describe ChallengeSetting, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
