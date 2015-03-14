require "rails_helper"

RSpec.describe PlaceBeensController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/place_beens").to route_to("place_beens#index")
    end

    it "routes to #new" do
      expect(:get => "/place_beens/new").to route_to("place_beens#new")
    end

    it "routes to #show" do
      expect(:get => "/place_beens/1").to route_to("place_beens#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/place_beens/1/edit").to route_to("place_beens#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/place_beens").to route_to("place_beens#create")
    end

    it "routes to #update" do
      expect(:put => "/place_beens/1").to route_to("place_beens#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/place_beens/1").to route_to("place_beens#destroy", :id => "1")
    end

  end
end
