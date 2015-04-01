# self




# this code gets me all the keys for this look up. but geocde will not do it's thing until a key is provided, but not sure where the key goes... going to try to make a autocomplete bymself, no damn gem.
chi = Unirest.get("http://maps.googleapis.com/maps/api/geocode/json?latlng=41.8818,-87.6232").body["results"]
p chi.class
chi.each do |key|
  puts key["place_id"]
end


# => weather app embed
<iframe id="forecast_embed" class="weather_iframe" type="text/html" frameborder="0" height="60" width="100%" src="http://forecast.io/embed/#lat=<%= @profile.latitude %>&lon=<%= @profile.longitude %>&name=<%= @profile.locality %>"> </iframe>


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

# GOOGLE MAPS****** ********************
#{@profile.latitude},#{@profile.longitude}
map with denver marker

"http://maps.google.com/maps/api/staticmap?center=39.739236,-104.990251&markers=<%= @profile.latitude %>,<%= @profile.longitude %>|39.739236,-104.990251|40.792240,-73.138260&size=750x300"

@places_been = "http://maps.google.com/maps/api/staticmap?center=#{@profile.latitude},#{@profile.longitude}&markers=color:yellow|label:#{@first_init}|#{@profile.latitude},#{@profile.longitude}|39.739236,-104.990251|40.792240,-73.138260|-33.918861,18.423300&size=750x300"

take out the zoom and it will zoom to see the two markers

url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur)


http://maps.googleapis.com/maps/api/staticmap?center=denver+co&zoom=13&scale=false&size=600x300&maptype=roadmap&format=png&visual_refresh=true&markers=size:small%7Ccolor:red%7Clabel:1%7Cdenver+co

