class InvitesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @invite = Invite.new
    @invites = Challenge.find(params[:challenge_id]).invites.order(created_at: :desc)
    @challenge = Challenge.find(params[:challenge_id])
  end

  def create
    @invite = Invite.create(invite_params)
    @invites = Challenge.find(params[:challenge_id]).invites.order(created_at: :desc)
    InviteMailer.invite_email(@invite)
    respond_to :js
  end

  private

  def invite_params
    params.require(:invite).permit(:challenge_id, :email, :invited_id)
  end
end
