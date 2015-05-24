class ChallengesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @typus = ["running", "food"]
    @challenges = Challenge.find_by(user_id: current_user.id)
  end

  def new
    @typus = 'running'
    @challenge = Challenge.new
    @milestones = [12, 13, 14]
    @days = [30, 26, 22]
  end

  def create
    @challenge = Challenge.create(challenge_params)
    if @challenge
      puts params.to_json
      flash[:notice] = "Challenge created"
      redirect_to new_challenge_user_relation_path(@challenge)
    else
      flash[:notice] = "Challenge couldn't be created"
      redirect_to :back
    end
  end

  def show
  end

  private

  def challenge_params
    params.require(:challenge).permit(:start_date, :end_date, :typus, :number_of_milestones)
  end
end
