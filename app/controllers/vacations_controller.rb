class VacationsController < ApplicationController

  def index
    #@profile = current_profile.first_name
    @vacations = Vacation.where({:user_id => current_user.id})
    @profile   = Profile.find_by(:user_id => current_user.id)
    
  end

  def new
    @profile = Profile.find_by(:user_id => current_user.id)
  end

  def create
    @vacation = Vacation.create ({:vacation_name => params[:vacation_name], :city => params[:city], :state => params[:state], :note => params[:note], :transpertation => params[:transpertation], :arrive_by => params[:arrive_by], :user_id => current_user.id})
    
    @hotel    = Accommodation.create({:name => params[:name], :address => params[:address], :city => params[:city], :zip => params[:zip], :vacation_id => @vacation.id})

    flash[:success] = "A new vacation has been added!"
    redirect_to vacation_path(@vacation.id)
  end

  def show
    @vacations = Vacation.where({:user_id => current_user.id}) #these should be helpers, i have this code  all over.
    @profile   = Profile.find_by(:user_id => current_user.id)
    @vacation  = Vacation.find_by({:user_id => current_user.id, :id => params[:id]})
    @hotel     = Accommodation.find_by(:vacation_id => @vacation.id)
    @spots     = VacationSpot.all
  end

end


# @vacation = Vacation.find_by(:user_id => current_user.id)
# if !@vacation
#   Vacation.create({:user_id => current_user.id})
# end
