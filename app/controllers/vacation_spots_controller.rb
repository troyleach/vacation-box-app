class VacationSpotsController < ApplicationController

  def show
    @vacations  = Vacation.where({:user_id => current_user.id})
    @profile    = Profile.find_by({:user_id => current_user.id})
    @spot       = VacationSpot.find_by(:id => params[:id])
  end

end
