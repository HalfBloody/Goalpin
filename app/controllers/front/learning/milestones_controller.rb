class Front::Learning::MilestonesController < ApplicationController


  def new
    @challenge = Challenge.find(params[:challenge_id])
    @milestones = @challenge.milestones
    @new_milestone = @challenge.milestones.build
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @milestone = Milestone.create(milestone_params)
    @challenge.milestones << @milestone
    respond_to :js
  end

  def destroy
    @milestone = Milestone.find(params[:id])
    if @milestone
      @milestone.delete
    end
    respond_to :js
  end

  private
  def milestone_params
    params.require(:milestone).permit(:challenge_id, :name, :days)
  end
end
