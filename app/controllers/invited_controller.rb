class InvitedController < ApplicationController
  before_filter :authenticate_user!, except: :create
  def create
    @invite = Invite.find_by(params[:token])
    @challenger = @invite.chellenge.user
    if @invite?
      @user = User.create(email: @invite.email)
      @invite.update_attributes(user_id: @user.id)
      flash[:message] = "Thank you for helping your friend with the challenge."
      redirect_to :show
    else
      flash[:message] = "The challenge you were looking for doesn't exist."
      redirect_to :root
    end
  end

  def show

  end
end
