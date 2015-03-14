class PlaceBeensController < ApplicationController
  #before_action :set_place_been, only: [:show, :edit, :update, :destroy]

  # GET /place_beens
  # GET /place_beens.json
  def index
    @place_beens = PlaceBeen.all
  end

  # GET /place_beens/1
  # GET /place_beens/1.json
  def show
  end

  # GET /place_beens/new
  def new
    @place_been = PlaceBeen.new
  end

  # GET /place_beens/1/edit
  def edit
    
  end

  # POST /place_beens
  # POST /place_beens.json
  def create

    @place_been = PlaceBeen.create ({:latitude => params[:latitude], :longitude => params[:longitude], :address => params[:address], :description => params[:description], :title => params[:title], :user_id => current_user.id})

    flash[:success] = "A new marker has been added!"
    redirect_to vacations_path

    # @place_been = PlaceBeen.new(place_been_params)
    # respond_to do |format|
    #   if @place_been.save
    #     format.html { redirect_to @place_been, notice: 'Place been was successfully created.' }
    #     format.json { render :show, status: :created, location: @place_been }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @place_been.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /place_beens/1
  # PATCH/PUT /place_beens/1.json
  def update
    # respond_to do |format|
    #   if @place_been.update(place_been_params)
    #     format.html { redirect_to @place_been, notice: 'Place been was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @place_been }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @place_been.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /place_beens/1
  # DELETE /place_beens/1.json
  def destroy
    @place_been.destroy
    respond_to do |format|
      format.html { redirect_to place_beens_url, notice: 'Place been was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_place_been
  #     @place_been = PlaceBeen.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def place_been_params
  #     params.require(:place_been).permit(:latitude, :longitude, :user_id, :address, :description, :title)
  #   end
end
