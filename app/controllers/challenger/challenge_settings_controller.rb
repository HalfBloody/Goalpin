class Challenger::ChallengeSettingsController < ApplicationController
  def new
    @challenge = Challenge.find(params[:challenge_id]) 
    @challenge_setting = ChallengeSetting.new(challenge_id: @challenge.id)
    @params = params
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_setting = ChallengeSetting.create(challenge_setting_params)
    redirect_to new_challenger_challenge_invite_path(@challenge)
  end

  private
  def challenge_setting_params
    params.require(:challenge_setting).permit(:daily_email, :weekly_email, :challenge_id)
  end
end
