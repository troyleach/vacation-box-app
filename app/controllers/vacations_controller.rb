class VacationsController < ApplicationController
#  # Unirest.get("https://api.forecast.io/forecast/43b5d766e91f96d89c060b58e2c71a01/38.8899,-77.009") DC
#  # ForecastIO.api_key = '43b5d766e91f96d89c060b58e2c71a01'

  def index
#    #@profile = current_profile.first_name
#    ForecastIO.api_key = '43b5d766e91f96d89c060b58e2c71a01'
    @helper       = Vacation.new
    @vacations    = Vacation.where({:user_id => current_user.id})
    @user_profile = Profile.all 
    @profile      = Profile.find_by(:user_id => current_user.id)
    @places_been  = PlaceBeen.where(:user_id => current_user.id)
    @messages     = Message.all
    @users        = User.all


# to make helper methods make a class then call self.'what_ever_the_method_name' then I can call
# just the method

#https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=CnRtAAAATLZNl354RwP_9UKbQ_5Psy40texXePv4oAlgP4qNEkdIrkyse7rPXYGd9D_Uj1rVsQdWT4oRz4QrYAJNpFX7rzqqMlZw2h2E2y5IKMUZ7ouD_SlcHxYq1yL4KbKUv3qtWgTK0A6QbGh87GB3sscrHRIQiG2RrmU_jF4tENr9wGS_YxoUSSDrYjWmrNfeEHSGSc3FyhNLlBU&key=AIzaSyClgAPyN1ArCGKPPQJQUt8tqBZ5KyDvDdk

town = Unirest.get("http://maps.googleapis.com/maps/api/geocode/json?latlng=#{@profile.latitude},#{@profile.longitude}").body["results"]
p town

http://maps.googleapis.com/maps/api/geocode/json?latlng=47.6062,-122.332
# chi.each do |key|
#   puts key["place_id"]
# end

# @chi_place = Unirest.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJ7cv00DwsDogRAMDACa2m4K8&key=AIzaSyClgAPyN1ArCGKPPQJQUt8tqBZ5KyDvDdk")
# p @chi_place


buz = Geocoder.search("ChIJ2YL9LrFqkFQR5JRZiYwXaIc", :lookup => :google_places_details)

p buz  
    # Below can be put into a helper...
    # if @profile == nil || @profile.city == nil
    #   @current_weather = nil
    # else
    #   @current_weather = Unirest.get("https://api.forecast.io/forecast/43b5d766e91f96d89c060b58e2c71a01/#{@profile.latitude},#{@profile.longitude}").body["currently"]
    # end

#    # current_weather = ForecastIO.forecast(@profile.latitude, @profile.longitude)
#    # @current_weather = current_weather["currently"]

    
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
    @profile = Profile.find_by(:user_id => current_user.id)
  end

  def create
    @vacation = Vacation.create ({:vacation_name => params[:vacation_name], :city => params[:city], :state => params[:state], :note => params[:note], :transpertation => params[:transpertation], :arrive_by => params[:arrive_by], :user_id => current_user.id})
    
    @hotel    = Accommodation.create({:name => params[:name], :address => params[:address], :city => params[:city], :zip => params[:zip], :vacation_id => @vacation.id})

    flash[:success] = "A new vacation has been added!"
    redirect_to vacation_path(@vacation.id)
  end

  def show
    @vacations = Vacation.where({:user_id => current_user.id}) #these should be helpers, i have this code  all over.

    @spots     = VacationSpot.where({:vacation_id => params[:id]})
    @profile   = Profile.find_by(:user_id => current_user.id)
    @vacation  = Vacation.find_by({:user_id => current_user.id, :id => params[:id]})
    @hotel     = Accommodation.find_by(:vacation_id => @vacation.id)
  end

end


# @vacation = Vacation.find_by(:user_id => current_user.id)
# if !@vacation
#   Vacation.create({:user_id => current_user.id})
# end
