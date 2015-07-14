class Front::Learning::SubMilestonesController < ApplicationController
  def new
    @milestone = Milestone.find(params[:milestone_id])
    @sub_milestone = @milestone.sub_milestones.build
    respond_to :js
  end

  def create
    @sub_milestone = Milestone.create(sub_milestone_params)
    respond_to :js
  end

  def destroy
    @sub_milestone = Milestone.find(params[:id])
    if @sub_milestone
      @sub_milestone.delete
    end
    respond_to :js
  end

  private
  def sub_milestone_params
    params.require(:milestone).permit(:milestone_id, :challenge_id, :name)
  end
end
