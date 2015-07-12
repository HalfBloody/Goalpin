class Front::MentorChallengesController < ApplicationController

  def show
    @challenge = Challenge.find(params[:id])
    @is_mentor = @challenge.mentor?(current_user)
    if @is_mentor
      
      @conversation = Conversation.new(challenge_id: @challenge.id)
      @message = @conversation.messages.build
      @finished_milestones = Milestone.where(challenge_id: params[:id])
      @number_of_unfinished_milestones = @challenge.number_of_milestones - @challenge.finished_milestones
      @unfinished_milestones = []
      @number_of_unfinished_milestones.times do |um|
        @unfinished_milestones << Milestone.new(challenge_id: @challenge.id)
      end
      @milestones = @finished_milestones + @unfinished_milestones
    else
      raise ActionController::RoutingError.new('not found')
    end
  end
end
