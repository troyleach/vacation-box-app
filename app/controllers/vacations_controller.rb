class VacationsController < ApplicationController

  def index
    @helper       = Vacation.new
    @vacations    = Vacation.where({:user_id => current_user.id})
    @user_profile = Profile.all 
    @profile      = Profile.find_by(:user_id => current_user.id)
    @places_been  = PlaceBeen.where(:user_id => current_user.id)
    @messages     = Message.all
    @users        = User.all
    @page_title   = "LOGO"

    @current_weather = DarkSkyWeather::CurrentWeather.currently(ENV['WEATHER_API_KEY'], @profile.latitude, @profile.longitude)
    @week_of_weather = DarkSkyWeather::CurrentWeather.daily(ENV['WEATHER_API_KEY'], @profile.latitude, @profile.longitude)
    
    @week_of_weather.each do |day|
      if day.abbreviated_week_day == @current_weather.abbreviated_week_day
        @week_of_weather.delete(day)
      end
    end



# to make helper methods make a class then call self.'what_ever_the_method_name' then I can call
# just the method

#https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=CpQBggAAAC96VMxadlDx6-6N4yECVhYxBCvVGeceYtpYT-YaSWpuNsaHtAmo_vLzFbsDU9sjBaZhZycj4ymMZSl3-9tZC271i6fQjWCCMNgXFWOOZDvFG0WIuIEuVIGw9iVAeMERQAOHJIKOWRAm51ar2QHk3CnVlGY4HEDY21zUgUBTI3dcFkYf2Q9NeDqkhsmjgLRPbhIQrUIgSudcu20gtyO5Mvo_xBoUKDxriTWJFQUJfAPpUmrNfUvjC7I&key=KEY

# https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=38.9072,-77.0369&radius=8100&key=#{ENV['GOOGLE_API_KEY']

# below places details requests - should have up to 10 pics
#https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJW-T2Wt7Gt4kRKl2I1CJFUsI&key=#{ENV['GOOGLE_API_KEY']}

# town = Unirest.get("#{ENV['GOOGLE_GEOCODE_URL']}?latlng=#{@profile.latitude},#{@profile.longitude}").body
# p town

# http://maps.googleapis.com/maps/api/geocode/json?latlng=47.6062,-122.332
# chi.each do |key|
#   puts key["place_id"]
# end

# @chi_place = Unirest.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJJVTnmL63t4kR8N_Fwo64AHA&key=#{ENV['GOOGLE_API_KEY']}")
# p @chi_place


# @buz = Geocoder.search("ChIJ7cv00DwsDogRAMDACa2m4K8", :lookup => :google_places_details)
# @helper.line
# p @buz

#     # Below can be put into a helper...
#     if @profile == nil || @profile.locality == nil
#       @current_weather = nil
#     else
#       @current_weather = Unirest.get("#{ENV['WEATHER_API_URL']}/#{ENV['WEATHER_API_KEY']}/#{@profile.latitude},#{@profile.longitude}").body["daily"]["data"]
#     end
# @helper.line
# p @current_weather.size
   
    @hash = Gmaps4rails.build_markers(@vacations) do |vacation, marker|
      marker.lat vacation.latitude
      marker.lng vacation.longitude
      marker.picture({
           :url => "http://chart.apis.google.com/chart?chst=d_map_xpin_letter_withshadow&chld=pin_star|G|B9121B|FCFAE1|FCFAE1",
                                                                                 #|<fill_color>|<text_color>|<star_fill_color>
           :width   => 50,
           :height  => 58
         })
    end
# need to figure out how to make map center on home state not the ocean, also need to make the pins bigger, most likely the scalable
    # http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=t|FF0000|000000
    @hash2 = Gmaps4rails.build_markers(@places_been) do |vacation, marker_two|
      marker_two.lat vacation.latitude
      marker_two.lng vacation.longitude
      marker_two.picture({
           :url => "https://chart.googleapis.com/chart?chst=d_map_pin_letter_withshadow&chld=B|E6E2AF|046380",
           :width   => 30,
           :height  => 30
         })
      marker_two.infowindow vacation.description
    end
   
   @hash3 = Gmaps4rails.build_markers(@profile) do |home, marker_three|
     marker_three.lat home.latitude
     marker_three.lng home.longitude
     marker_three.picture({
          :url => "http://chart.apis.google.com/chart?chst=d_map_xpin_icon_withshadow&chld=pin_sright|home|C9DE55|FCFAE1",
          :width   => 30,
          :height  => 30
        })
   end
    
  end

  def new
    @vacations  = Vacation.where({:user_id => current_user.id})
    @profile    = Profile.find_by(:user_id => current_user.id)
    @helper     = Vacation.new
    @page_title   = "Create a New Vacation!"
  end

  def create
    @vacation = Vacation.create ({:vacation_name => params[:vacation_name], :city => params[:city], :state => params[:state], :note => params[:note], :transpertation => params[:transpertation], :arrive_by => params[:arrive_by], :user_id => current_user.id})
        
    @hotel    = Accommodation.create({:name => params[:name], :address => params[:address], :city => params[:city], :zip => params[:zip], :vacation_id => @vacation.id})

    flash[:success] = "A new vacation has been added!"
    redirect_to vacation_path(@vacation.id)
  end

  def show
    @vacations = Vacation.where({:user_id => current_user.id}) #these should be helpers, i have this code  all over.

    @spots      = VacationSpot.where({:vacation_id => params[:id]})
    @profile    = Profile.find_by(:user_id => current_user.id)
    @vacation   = Vacation.find_by({:user_id => current_user.id, :id => params[:id]})
    @hotel      = Accommodation.find_by(:vacation_id => @vacation.id)
    @helper     = Vacation.new
    @page_title = @vacation.vacation_name

    @current_weather = DarkSkyWeather::CurrentWeather.currently(ENV['WEATHER_API_KEY'], @vacation.latitude, @vacation.longitude)
    @helper.line
    p @current_weather

    @week_of_weather = DarkSkyWeather::CurrentWeather.daily(ENV['WEATHER_API_KEY'], @profile.latitude, @profile.longitude)

    p @week_of_weather[1].to_date
    
  end

end
