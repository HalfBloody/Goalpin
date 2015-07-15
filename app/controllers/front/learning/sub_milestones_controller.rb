class Front::Learning::SubMilestonesController < ApplicationController
  respond_to :json, only: :update
  def new
    @milestone = Milestone.find(params[:milestone_id])
    @sub_milestone = @milestone.sub_milestones.build
    respond_to :js
  end

  def create
    @sub_milestone = Milestone.create(sub_milestone_params)
    @milestone = @sub_milestone.parent_milestone
    respond_to :js
  end

  def destroy
    @sub_milestone = Milestone.find(params[:id])
    if @sub_milestone
      @sub_milestone.delete
    end
    respond_to :js
  end

  def update
    puts params
    @sub_milestone = Milestone.find(params[:id])
    if @sub_milestone.update(sub_milestone_params)
      puts @sub_milestone.to_json
      respond_to do |format|
        format.json { respond_with status: 200 }
      end
    else
      respond_to do |format|
        format.json { render status: 406 }
      end
    end
  end

  private
  def sub_milestone_params
    params.permit(:milestone_id, :challenge_id, :name, :days)
  end
end
