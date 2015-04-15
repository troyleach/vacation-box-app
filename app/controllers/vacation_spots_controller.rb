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

    @transpertation   = @current_vacation.transpertation

    if @current_vacation.transpertation.upcase == "CAR RENTAL"
      @transpertation = "driving"
    end

    if @current_vacation.transpertation == "bus or train"
      @transpertation = "transit"
    end

    

    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@spot)
        send_data pdf.render, filename: "#{@page_title}'.pdf", type: 'application/pdf'
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
