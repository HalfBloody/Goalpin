class Front::MentorsController < ApplicationController

  def create
    @invite = Invite.find_by(token: params[:token])
    if @invite
      session[:invite_token] = params[:token]
      # @challenger = @invite.inviter
      # @mentor = User.create(email: @invite.email)
      # @invite.update_attributes(mentor_id: @mentor.id)
      # flash[:message] = "Thank you for helping your friend with the challenge."
      redirect_to front_challenges_path
    else
      flash[:message] = "The challenge you were looking for doesn't exist."
      redirect_to :root
    end
  end
end
