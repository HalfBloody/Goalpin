class MentorsController < ApplicationController
  before_filter :authenticate_user!, except: :create
  def create
    @invite = Invite.find_by(token: params[:token])
    @challenger = @invite.challenge.user
    if @invite
      @user = User.create(email: @invite.email)
      @invite.update_attributes(invited_id: @user.id)
      flash[:message] = "Thank you for helping your friend with the challenge."
      redirect_to :show
    else
      flash[:message] = "The challenge you were looking for doesn't exist."
      redirect_to :root
    end
  end

  def show
    pass
  end
end
