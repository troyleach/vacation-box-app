class VacationsController < ApplicationController

  def index
    #@profile = current_profile.first_name
    @profile = Profile.find_by(:user_id => current_user.id)
  end

  def new
    @profile = Profile.find_by(:user_id => current_user.id)
  end

  def create

    @vacation = Vacation.create ({:vacation_name => params[:vacation_name], :city => params[:city], :state => params[:state], :note => params[:note], :user_id => current_user.id})
    
    flash[:success] = "A new vacation has been added!"
    redirect_to vacation_path(@vacation.id)
  end

  def show
    time_date = Time.now
      
    @current_time_date = time_date.strftime("%b %e, %l:%M %p")
    
    @vacation = Vacation.find_by({:user_id => current_user.id, :id => params[:id]})
    puts '*****************************'
    puts @vacation.inspect
  end

end


# @vacation = Vacation.find_by(:user_id => current_user.id)
# if !@vacation
#   Vacation.create({:user_id => current_user.id})
# end
