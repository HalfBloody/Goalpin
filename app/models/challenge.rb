# == Schema Information
#
# Table name: challenges
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  typus                :string(255)
#  start_date           :datetime
#  end_date             :datetime
#  number_of_milestones :integer
#  finished_milestones  :integer
#  facebook             :boolean
#  created_at           :datetime
#  updated_at           :datetime
#  name                 :string(255)
#  description          :string(255)
#

class Challenge < ActiveRecord::Base
  

  belongs_to :challenger, class_name: "User", foreign_key: "user_id"
  has_many :invites
  has_many :mentors, through: :invites
  
  has_one :challenge_setting
  has_many :milestones
  has_many :conversations

  accepts_nested_attributes_for :milestones

  # Learning challenge validations
  validates :name, presence: true, if: :is_running_challenge?, on: :create

  before_create :reset_milestones

  STATUS = {
    finished: "finished",
    not_started: "not started",
    on_track: "on track",
    behind_schedule: "behind schedule"
  }

  scope :learning_challenges, -> { where(typus: 'learning_challenge') }
  scope :running_challenges, -> { where(typus: 'running_challenges') }

  def status
    # status of a particular challenge
    case true
    when self.finished?
      :finished
    when self.not_started?
      :not_started
    when self.behind_schedule?
      :behind_schedule
    else
      :on_track
    end
  end

  def owner? (user)
    self.user_id == user.id
  end

  def mentor? (user)
    self.mentors.include? user
  end

  def last_milestone_completed_at
    if self.last_milestone
      self.last_milestone.completed_at
    else
      self.start_date
    end
  end

  def self.conversations
    self.messages

  end

  def time_progress
    ([[(days_since_start.to_f / total_days.to_f), 1].min, 0].max * 100)
  end

  def milestone_progress
    ([[(finished_milestones.to_f / number_of_milestones.to_f), 1].min, 0].max * 100)
  end

  def behind_schedule?
    self.time_progress > milestone_progress
  end

  def reset_milestones
    self.finished_milestones = 0
  end

  def complete_milestone
    if (self.finished_milestones < self.number_of_milestones)
      Milestone.complete(self.id)
      self.increment!(:finished_milestones)
    end
  end

  def finished?
    self.milestones.size >= self.number_of_milestones
  end

  def not_started?
    self.milestones.size == 0
  end

  def last_milestone
    self.milestones.order(completed_at: :desc).first
  end

  def finished_at
    if finished?
      last_milestone.completed_at
    end
  end

  def time_finished_before_end
    self.end_date self.last.milestone.completed_at
  end

  private
  def total_days
    ((self.end_date - self.start_date)/1.day).to_i
  end

  def days_since_start
    ((Time.now - self.start_date)/1.day).to_i
  end

  def is_running_challenge?
    typus == 'learning_challenge' ? true : false
  end
end
