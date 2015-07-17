class Front::Learning::ChallengesController < ApplicationController

  def new
    @challenge = Challenge.new
    @days = [15, 30, 60]
  end

  def create
    @challenge = Challenge.create(challenge_params)
    redirect_to new_front_learning_challenge_milestone_path(@challenge)
  end

  def update
    puts('it worked')
    redirect_to params[:redirect_url]
  end

  private
  def challenge_params
    params.require(:challenge).permit(:name, :description, :start_date, :end_date).merge(typus: "learning", user_id: current_user.id)
  end
end
