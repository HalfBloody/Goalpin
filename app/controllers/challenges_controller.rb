class ChallengesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @challenges = Challenge.find_by(user_id: current_user.id)
  end

  def new
  end

  def create
  end

  def show
  end
end
