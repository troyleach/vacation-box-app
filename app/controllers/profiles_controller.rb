class ProfilesController < ApplicationController

  def index
  end

  def show
    
  end

  def edit
    #@profile = current_profile.first_name
    @profile = Profile.find_by(:user_id => current_user.id)
    if !@profile
      Profile.create({:user_id => current_user.id})
    end
  end

  def update
    @profile = Profile.find_by(:user_id => current_user.id)
    
      @profile.update({:first_name => params[:first_name], :last_name => params[:last_name], :username => params[:username], :address => params[:address], :city => params[:city], :state => params[:state], :zip => params[:zip]})


    flash[:success] = "Your profile has been updated!"
    redirect_to "/vacations"
  end

end
# flash[:success] = "A new vacation has been added!"
# redirect_to profiles_path "#{current_user.id}"
# redirect_to profile_path(current_user.id)