

def dayOfWeek
  day.each do |day|
  end
end

def convertSeconds(seconds)
  convertToDay(Time.at(seconds))
end

def convertToDay(the_object)
  the_object.strftime("%A")
end

puts convertSeconds(1426737600) 

# theDay = Time.at(t)

# puts theDay
# # => 2015-03-18 23:00:00 -0500
# theDay.strftime("%A")
# # => "Wednesday"

# cc.keys
# # => ["latitude", "longitude", "timezone", "offset", "currently", "minutely", "hourly", "daily", "flags"]

# day = cc["daily"]

# day.keys
# # =>  ["summary", "icon", "data"] 


# day = day["data"]
# theday = day[7]["time"]