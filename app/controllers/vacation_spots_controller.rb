class VacationSpotsController < ApplicationController

  def show
    @vacations    = Vacation.where({:user_id => current_user.id})
    @profile      = Profile.find_by({:user_id => current_user.id})
    @spot         = VacationSpot.find_by(:id => params[:id])
    @notes        = @spot.note
    @helper       = Vacation.new
    @page_title   = @spot.spot_name
    @full_address = "#{@spot.street_number} #{@spot.route}"
  end
# don't know if this will work anymore bc I made it API(maybe this isn't where this gets created!)
  def update
    @helper = Vacation.new
    @spot   = VacationSpot.find_by(:id => params[:id])
    @spot.update({:note => params[:note]})
    redirect_to vacation_spot_path(@spot.id)
  end


end
