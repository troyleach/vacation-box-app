class Api::V1::VacationsController < ApplicationController
  
  def show
    @vacation = Vacation.find(params[:id])
  end

  def create
      
  end

end