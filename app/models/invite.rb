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

  # validates :email, uniqueness: true, on: :create
  validates :email, format: Devise::email_regexp

  before_create :add_token



  private

  def add_token
    token = SecureRandom.hex(30).upcase
    self.token = token
  end

end

