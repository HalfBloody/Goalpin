class InvitedController < ApplicationController
  before_filter :authenticate_user!, except: :create
  def create
    @invite = Invite.find_by(params[:token])
    @challenger = @invite.chellenge.user
    if @invite? and @invite.user_id.nil?
      @user = User.create(email: @invite.email)
      @invite.update_attributes(user_id: @user.id)
      flash[:message] = "Please create an account to help #{@challenger.email}"
      redirect_to :show
    elsif @invite
      flash[:message] = "Thanks for coming back"
      redirect_to :show
    else
      flash[:message] = "The challenge you were looking for doesn't exist."
      redirect_to :root
    end
  end

  def show

  end
end
