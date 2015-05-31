module Front::ChallengesHelper

  def add_days(time, day_num)
    time + day_num.days
  end
end
