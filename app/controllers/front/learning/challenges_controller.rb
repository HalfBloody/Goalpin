class Front::Learning::ChallengesController < ApplicationController

  def new
    @challenge = Challenge.new(typus: "learning")
  end
end
