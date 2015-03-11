class VacationSpotsController < ApplicationController

  def index
    # these is ending up to be everywhere, in every controller
    @vacations  = Vacation.where({:user_id => current_user.id})
    @profile    = Profile.find_by(:user_id => current_user.id)
    @spots       = VacationSpot.all
    
  end

  def show
    @profile    = Profile.find_by(:user_id => current_user.id)
    @vacations  = Vacation.where({:user_id => current_user.id})
  end

end
