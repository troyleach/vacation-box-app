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
    @hotel            = Accommodation.find_by(:vacation_id => @current_vacation.id)

    @helper.line
    p @current_vacation.transpertation.upcase

    @transite = Unirest.get("https://maps.googleapis.com/maps/api/directions/json?origin=Brooklyn&destination=Queens&mode=transit&key=AIzaSyCGrehijmS0whBx20TDfi4lZTH4pCuIjn4").body["routes"]

    @walking = Unirest.get("https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&avoid=highways&mode=walking&key=AIzaSyCGrehijmS0whBx20TDfi4lZTH4pCuIjn4").body["routes"]

    @bicycling = Unirest.get("https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&avoid=highways&mode=bicycling&key=AIzaSyCGrehijmS0whBx20TDfi4lZTH4pCuIjn4").body["routes"]
        
         
    @car = Unirest.get("https://maps.googleapis.com/maps/api/directions/json?origin=38.914638,-77.040386&destination=38.9017,-77.0375&key=AIzaSyCGrehijmS0whBx20TDfi4lZTH4pCuIjn4").body["routes"]
    
  end

  def update
    @helper = Vacation.new
    @spot   = VacationSpot.find_by(:id => params[:id])
    @spot.update({:note => params[:note]})
    redirect_to vacation_spot_path(@spot.id)
  end


end
