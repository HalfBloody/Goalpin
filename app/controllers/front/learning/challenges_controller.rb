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
    @challenge = Challenge.find(params[:id])
    if @challenge.update(challenge_params)
      redirect_to params[:redirect_url], notice: 'challenge successfully updated'
    else
      render new_front_learning_challenge_milestone_path(@challenge)
    end
  end

  private
  def challenge_params
    params.require(:challenge).permit(:name, :description, :start_date, :end_date).merge(typus: "learning", user_id: current_user.id)
  end
end
