class VacationsController < ApplicationController

  def index
    #@profile = current_profile.first_name
    @profile = Profile.find_by(:user_id => current_user.id)
    # if !@profile
    #   Profile.create(:user_id => current_user.id)
    # end
    #I hope that I can Profile.create when my site first opens and then
    #use update to update the profiles page!
  end

  def new
    
  end

  def create
    flash[:success] = "A new vacation has been added!"
    redirect_to vacations_path
  end

end
