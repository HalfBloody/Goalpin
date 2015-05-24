class UserRelationsController < ApplicationController
  def new
    @user_relation = UserRelation.new
    puts params
    @challenge = Challenge.find(params[:challenge_id])
  end

  def create

  end

  def index

  end
end
