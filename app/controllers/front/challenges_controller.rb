class Front::ChallengesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @typus = ["running", "food"]
    @challenges = Challenge.where(user_id: current_user.id)
    
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
      redirect_to new_front_challenge_challenge_setting_path(@challenge)
    else
      flash[:notice] = "Challenge couldn't be created"
      redirect_to :back
    end
  end

  def show
    @invite = Invite.new
    @challenge = Challenge.find(params[:id])
    @invites = @challenge.invites.order(created_at: :desc)
    @challenge_setting = @challenge.challenge_setting
    @milestones = Milestone.where(challenge_id: params[:id])
    
  end

  private

  def challenge_params
    params.require(:challenge).permit(:start_date, :end_date, :typus, :number_of_milestones).merge(user_id: current_user.id)
  end
end