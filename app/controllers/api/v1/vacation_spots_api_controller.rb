class Api::V1::VacationSpotsApiController < ApplicationController

  def index
    @lumber = Lumber.all
  end

  def show
    @lumber = Lumber.find(params[:id])
  end

  def create
    @lumber = Lumber.create({:dimensions => params[:dimensions], :species => params[:species], :sizes => params[:sizes], :use => params[:use]})
    if @lumber.save
    else
      render json: { errors: @lumber.errors.full_messages }, status: 422
    end
  end

end