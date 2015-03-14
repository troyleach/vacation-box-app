class VacationsController < ApplicationController
#  # Unirest.get("https://api.forecast.io/forecast/43b5d766e91f96d89c060b58e2c71a01/38.8899,-77.009") DC
#  # ForecastIO.api_key = '43b5d766e91f96d89c060b58e2c71a01'
  def index
#    #@profile = current_profile.first_name
#    ForecastIO.api_key = '43b5d766e91f96d89c060b58e2c71a01'
    @vacations = Vacation.where({:user_id => current_user.id})
    @profile   = Profile.find_by(:user_id => current_user.id)
    @places_been = PlaceBeen.where(:user_id => current_user.id)
    p "#{@profile.latitude}"
    p "#{@profile.longitude}"
    @letter = "T"



    # Below can be put into a helper...
    # @current_weather = Unirest.get("https://api.forecast.io/forecast/43b5d766e91f96d89c060b58e2c71a01/#{@profile.latitude},#{@profile.longitude}").body["currently"]

#    # current_weather = ForecastIO.forecast(@profile.latitude, @profile.longitude)
#    # @current_weather = current_weather["currently"]

    
    @hash = Gmaps4rails.build_markers(@vacations) do |vacation, marker|
      marker.lat vacation.latitude
      marker.lng vacation.longitude
      marker.picture({
           :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=t|FF0000|000000",
           :width   => 32,
           :height  => 32
         })
    end
    

    @hash2 = Gmaps4rails.build_markers(@places_been) do |vacation, marker_two|
      marker_two.lat vacation.latitude
      marker_two.lng vacation.longitude
      marker_two.picture({
           :url => "https://chart.googleapis.com/chart?chst=d_map_pin_letter_withshadow&chld=A|FF0000|0000FF",
           :width   => 30,
           :height  => 30
         })
      marker_two.infowindow vacation.description

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
