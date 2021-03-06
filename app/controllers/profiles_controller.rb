class ProfilesController < ApplicationController

  def index
  end

  def show
  end

  def edit
    #@profile = current_profile.first_name
    @vacations  = Vacation.where({:user_id => current_user.id})
    @profile    = Profile.find_by(:user_id => current_user.id)
    @helper     = Vacation.new
    @page_title = "Update your profile"
    if !@profile
      Profile.create({:user_id => current_user.id})
    end
  end

  def update
    @profile = Profile.find_by(:user_id => current_user.id)
    @helper  = Vacation.new
    
      @profile.update({:first_name => params[:first_name], :last_name => params[:last_name], :username => params[:username], :street_number => params[:street_number], :route => params[:route], :locality => params[:locality], :administrative_area_level_1 => params[:administrative_area_level_1], :postal_code => params[:postal_code], :country => params[:country], :place_id => params[:place_id]})


    flash[:success] = "Your profile has been updated!"
    redirect_to "/vacations"
  end

end
# flash[:success] = "A new vacation has been added!"
# redirect_to profiles_path "#{current_user.id}"
# redirect_to profile_path(current_user.id)