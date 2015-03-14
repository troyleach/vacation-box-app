require 'rails_helper'

RSpec.describe "PlaceBeens", :type => :request do
  describe "GET /place_beens" do
    it "works! (now write some real specs)" do
      get place_beens_path
      expect(response.status).to be(200)
    end
  end
end
