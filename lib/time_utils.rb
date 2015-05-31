module TimeUtils

  def time_diff_string(start_time, end_time)
    time_hash = TimeDifference.between(start_time, end_time).in_general
    time_string = time_hash.reduce("") do |str, (name, count)|
      str += stringify_part(name, count)
    end
    if time_string == ""
      return "1 second"
    else
      time_string
    end
  end

  private

  def stringify_part(name, count)
    name = name.to_s
    if count == 0
      ""
    elsif count == 1
      "#{count} " + name[0..-2] + " "
    else
      count.to_s + " " + name + " "
    end      
  end
end