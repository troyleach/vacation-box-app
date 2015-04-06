class VacationSpotsController < ApplicationController

  def show
    @vacations        = Vacation.where({:user_id => current_user.id})
    @profile          = Profile.find_by({:user_id => current_user.id})
    @spot             = VacationSpot.find_by(:id => params[:id])
    @notes            = @spot.note
    @helper           = Vacation.new
    @page_title       = @spot.spot_name
    @full_address     = "#{@spot.street_number} #{@spot.route}"
    @current_vacation = Vacation.find_by({:id => @spot.vacation_id})
    @key              = "#{ENV['GOOGLE_API_KEY']}" 
     

   @directions        = Unirest.get("https://maps.googleapis.com/maps/api/directions/json?origin=38.914638,-77.040386&destination=38.911466,-77.443074&key=#{ENV['GOOGLE_API_KEY']}").body["routes"]
@helper.line
    p @directions
  end

  def update
    @helper = Vacation.new
    @spot   = VacationSpot.find_by(:id => params[:id])
    @spot.update({:note => params[:note]})
    redirect_to vacation_spot_path(@spot.id)
  end


end
