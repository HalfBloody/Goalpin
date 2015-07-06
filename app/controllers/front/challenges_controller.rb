class Front::ChallengesController < ApplicationController
  before_filter :authenticate_user!, :update_invite

  def index
    @typus = ["running", "food"]
    @challenges = Challenge.where(user_id: current_user.id)
    @challenge_activities = Milestone.last_mentored_activities(current_user)
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
    @finished_milestones = Milestone.where(challenge_id: params[:id])
    @number_of_unfinished_milestones = @challenge.number_of_milestones - @challenge.finished_milestones
    @unfinished_milestones = []
    @number_of_unfinished_milestones.times do |um|
      @unfinished_milestones << Milestone.new(challenge_id: @challenge.id)
    end
    @milestones = @finished_milestones + @unfinished_milestones
    
  end

  private

  def update_invite
    if session[:invite_token]
      @invite = Invite.find_by(token: session[:invite_token])
      @invite.update_attributes(mentor_id: current_user.id)
      session[:invite_token] = nil
    end
  end

  def challenge_params
    params.require(:challenge).permit(:start_date, :end_date, :typus, :number_of_milestones).merge(user_id: current_user.id)
  end
end
