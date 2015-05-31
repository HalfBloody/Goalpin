class Front::ChallengeSettingsController < ApplicationController
  def new
    @challenge = Challenge.find(params[:challenge_id]) 
    @challenge_setting = ChallengeSetting.new(challenge_id: @challenge.id)
    @params = params
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_setting = ChallengeSetting.create(challenge_setting_params)
    redirect_to new_front_challenge_invite_path(@challenge)
  end

  def update
    @challenge_setting = ChallengeSetting.find_by(challenge_id: params[:challenge_id])
    @challenge_setting.update_attributes(challenge_setting_params)
    redirect_to :back
  end

  private
  def challenge_setting_params
    params.require(:challenge_setting).permit(:id, :daily_email, :weekly_email, :challenge_id)
  end
end
