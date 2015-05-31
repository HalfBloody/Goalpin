class Front::MilestonesController < ApplicationController
  def create
    @challenge = Challenge.find(params[:challenge_id])
    @challenge.complete_milestone
    @number_of_unfinished_milestones = @challenge.number_of_milestones - @challenge.finished_milestones
    puts @number_of_unfinished_milestones
    @finished_milestones = Milestone.where(challenge_id: params[:challenge_id])
    @unfinished_milestones = []
    @number_of_unfinished_milestones.times do |um|
      @unfinished_milestones << Milestone.new(challenge_id: @challenge.id)
    end
    @milestones = @finished_milestones + @unfinished_milestones
    respond_to :js
  end

  private

  def milestone_params
    params.require(:milestone).permit(:challenge_id)
  end
end
