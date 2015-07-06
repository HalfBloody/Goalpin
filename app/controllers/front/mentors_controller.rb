class Front::MentorsController < ApplicationController

  def create
    @invite = Invite.find_by(token: params[:token])
    if @invite
      @challenger = @invite.inviter
      @mentor = User.create(email: @invite.email)
      @invite.update_attributes(mentor_id: @mentor.id)
      flash[:message] = "Thank you for helping your friend with the challenge."
      redirect_to mentor_challenges_path
    else
      flash[:message] = "The challenge you were looking for doesn't exist."
      redirect_to :root
    end
  end
end
