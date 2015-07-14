class Front::Learning::ChallengesController < ApplicationController

  def new
    @challenge = Challenge.new
    @days = [15, 30, 60]
  end

  def create

    @challenge = Challenge.create(challenge_params)
    redirect_to new_front_learning_challenge_milestone_path(@challenge)
  end

  private
  def challenge_params
    params.require(:challenge).permit(:name, :description).merge(typus: "learning")
  end
end
