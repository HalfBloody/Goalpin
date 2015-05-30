class Mentor::ChallengesController < ApplicationController
  def index
    @mentor = User.find(current_user.id)
    @challenges = @mentor.challenges
  end

  def show
  end
end
