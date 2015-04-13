require "open-uri"
class VacationSpotsController < ApplicationController

    def index
      @helper           = Vacation.new
      @vacations        = Vacation.where({:user_id => current_user.id})

    end

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
    p @spot

    

    

# I don't think I need any of this code below, I wrote JS for it
    # @transite = Unirest.get("https://maps.googleapis.com/maps/api/directions/json?origin=Brooklyn&destination=Queens&mode=transit&key=AIzaSyCGrehijmS0whBx20TDfi4lZTH4pCuIjn4").body["routes"]

    # @walking = Unirest.get("https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&avoid=highways&mode=walking&key=AIzaSyCGrehijmS0whBx20TDfi4lZTH4pCuIjn4").body["routes"]

    # @bicycling = Unirest.get("https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&avoid=highways&mode=bicycling&key=AIzaSyCGrehijmS0whBx20TDfi4lZTH4pCuIjn4").body["routes"]
        
         
    # @car = Unirest.get("https://maps.googleapis.com/maps/api/directions/json?origin=38.914638,-77.040386&destination=38.9017,-77.0375&key=AIzaSyCGrehijmS0whBx20TDfi4lZTH4pCuIjn4").body["routes"]

    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@spot)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
        

    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     pdf = ReportPdf.new(@spot)
    #     send_data pdf.render, type: 'application/pdf', disposition: "inline"
    #   end
    # end
    
  end

  def update
    @helper = Vacation.new
    @spot   = VacationSpot.find_by(:id => params[:id])
    @spot.update({:note => params[:note]})
    redirect_to vacation_spot_path(@spot.id)
  end


end
