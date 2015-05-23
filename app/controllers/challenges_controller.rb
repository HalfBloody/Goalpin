class ChallengesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @typus = ["running", "food"]
    @challenges = Challenge.find_by(user_id: current_user.id)
  end

  def new
    @typus = 'gone' #params[:typus]
    @challenge = Challenge.new
    @milestones = [12, 13, 14]
    @days = [30, 26, 22]
  end

  def create
    @challenge = Challenge.create(challenge_params)
    if @challenge
      flash[:notice] = "Challenge created"
      redirect_to new_user_relation_path
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
