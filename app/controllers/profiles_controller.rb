class ProfilesController < ApplicationController

  def index
  end

  def show
    # flash[:success] = "Your profile has been updated!"
    # redirect_to profile_path(current_user.id)
    # write an if statement that if they want to add their own picture
    # instead of the gravatar pic.
  end

  def update
    flash[:success] = "Your profile has been updated!"
    redirect_to "/vacations"
  end

end
# flash[:success] = "A new vacation has been added!"
# redirect_to profiles_path "#{current_user.id}"
# redirect_to profile_path(current_user.id)