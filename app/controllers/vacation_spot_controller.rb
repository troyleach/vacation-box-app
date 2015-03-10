class VacationSpotController < ApplicationController

  def index
    # these is ending up to be everywhere, in every controller
    @vacations  = Vacation.where({:user_id => current_user.id})
    @profile    = Profile.find_by(:user_id => current_user.id)
    @spots       = VacationSpot.all
    puts "****************"
    p @spots.size
  end

end
