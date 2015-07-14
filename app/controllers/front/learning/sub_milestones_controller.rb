class Front::Learning::SubMilestonesController < ApplicationController
  def new
    @milestone = Milestone.find(params[:milestone_id])
    @sub_milestone = @milestone.sub_milestones.build(name: "new subtask (pls change name)")
    respond_to :js
  end

  def create

    respond_to :js
  end

  def destroy
    @sub_milestone = Milestone.find(params[:id])
    if @sub_milestone
      @sub_milestone.delete
    end
    respond_to :js
  end
end
