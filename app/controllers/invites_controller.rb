class InvitesController < ApplicationController
  def new
    @invite = Invite.new
    puts params
    @challenge = Challenge.find(params[:challenge_id])
  end

  def create

    @invite = Invite.create(invite_params)
    redirect_to :back
  end

  def index

  end

  private

  def invite_params
    params.require(:invite).permit(:challenge_id, :email, :invited_id)
  end
end
