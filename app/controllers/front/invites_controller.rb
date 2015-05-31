require "time_utils.rb"

class Front::InvitesController < ApplicationController
  include TimeUtils
  before_filter :authenticate_user!
  helper_method :time_diff_string


  def new
    @invite = Invite.new
    @challenge = Challenge.find(params[:challenge_id])
    @invites = @challenge.invites.order(created_at: :desc)
    puts "bla"
    puts time_diff_string(@challenge.created_at, Time.now)
  end

  def create
    @invite = Invite.new(invite_params)    
    if @invite.save
      InviteMailer.invite_email(@invite).deliver
    end
    @invites = Challenge.find(params[:challenge_id]).invites.order(created_at: :desc)
    respond_to :js
  end

  private

  def invite_params
    params.require(:invite).permit(:challenge_id, :email, :mentor_id)
  end
end
