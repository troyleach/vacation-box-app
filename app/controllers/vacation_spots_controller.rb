class VacationSpotsController < ApplicationController

  def show
    @vacations  = Vacation.where({:user_id => current_user.id})
    @profile    = Profile.find_by({:user_id => current_user.id})
    @spot       = VacationSpot.find_by(:id => params[:id])
    @notes      = @spot.note
    @helper     = Vacation.new
    @page_title = @spot.spot_name
    p @notes
  end

  def update
    @helper = Vacation.new
    @spot   = VacationSpot.find_by(:id => params[:id])
    @spot.update({:note => params[:note]})
    redirect_to vacation_spot_path(@spot.id)
  end


end
