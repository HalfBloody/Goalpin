class ChallengesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @typus = ["running", "food"]
    @challenges = Challenge.find_by(user_id: current_user.id)
  end

  def new
    @typus = 'gone' #params[:typus]
    @challenge = Challenge.new
    @challenge.start_date = Time.now
  end

  def create
  end

  def show
  end
end
