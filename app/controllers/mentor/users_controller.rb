class Mentor::UsersController < ApplicationController
  before_filter :authenticate_user!, except: :create
  def create
    @invite = Invite.find_by(token: params[:token])
    if @invite
      @challenger = @invite.challenge.user      
      @mentor = User.create(email: @invite.email)
      @invite.update_attributes(mentor_id: @mentor.id)
      flash[:message] = "Thank you for helping your friend with the challenge."
      redirect_to mentor_challenges_path
    else
      flash[:message] = "The challenge you were looking for doesn't exist."
      redirect_to :root
    end
  end

  def show
    pass
  end
end
