class VacationsController < ApplicationController

  def index
    
  end

  def new
    
  end

  def create
    flash[:success] = "A new vacation has been added!"
    redirect_to vacations_path
  end

end
