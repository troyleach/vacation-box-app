class Api::V1::VacationsApiController < ApplicationController
  
  def show
    @vacation = Vacation.find(params[:id])
  end

  def create
      
  end

end