class Api::V1::VacationSpotsController < ApplicationController

  def index
    @spots = VacationSpot.all
  end

  def show
    @spot = VacationSpot.find(params[:id])
  end
# this might have to be update, need to look how it creates the damn entry
# Also I have not created any validations

  def create
    @spot = VacationSpot.new({:lat => params[:lat], :lng => params[:lng], :image => params[:image], :spot_name => params[:spot_name], :description => params[:description], :street_number => params[:street_number], :route => params[:route], :city => params[:city], :state => params[:state], :zip => params[:zip], :phone => params[:phone], :open => params[:open], :website => params[:website], :note => params[:note], :vacation_id => params[:vacation_id]})
    if @spot.save
    else
      render json: { errors: @spot.errors.full_messages }, status: 422
    end
  end

end