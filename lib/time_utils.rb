  module TimeUtils

  def time_diff_string(start_time, end_time, options = {} )
    max_parts = 3 # opt[:max_parts]
    time_hash = TimeDifference.between(start_time, end_time).in_general
    time_string = time_hash.reduce("") do |str, (name, count)|
      str += stringify_part(name, count)
    end
    if time_string == ""
      return "1 second"
    else
      cut(time_string, max_parts)
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

  def cut(string, max_parts)
    split_string = string.split(" ")
    max_parts = [split_string.size, max_parts*2-1].min
    split_string[0..max_parts].join(" ")
  end
end