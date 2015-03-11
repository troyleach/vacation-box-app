class VacationsController < ApplicationController
# employee = Employee.find(5)
# spot = VacationSpot.find(22) = will that return all the spots that belong to vacation 22
  def index
    #@profile = current_profile.first_name
    @vacations = Vacation.where({:user_id => current_user.id})
    @profile   = Profile.find_by(:user_id => current_user.id)
    
  end

  def new
    @vacations  = Vacation.where({:user_id => current_user.id})
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

    @spots     = VacationSpot.where({:vacation_id => params[:id]})
    puts "*************************"
    p @spots
    @profile   = Profile.find_by(:user_id => current_user.id)
    @vacation  = Vacation.find_by({:user_id => current_user.id, :id => params[:id]})
    @hotel     = Accommodation.find_by(:vacation_id => @vacation.id)
  end

end


# @vacation = Vacation.find_by(:user_id => current_user.id)
# if !@vacation
#   Vacation.create({:user_id => current_user.id})
# end
