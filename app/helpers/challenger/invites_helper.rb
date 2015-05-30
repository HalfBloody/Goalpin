   module Challenger::InvitesHelper

    def stringify_time_diff(time_hash)
      time_hash.reduce("") do |str, (name, count)|
        str += stringify_part(name, count)
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
