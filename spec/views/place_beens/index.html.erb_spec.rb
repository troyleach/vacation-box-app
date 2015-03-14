require 'rails_helper'

RSpec.describe "place_beens/index", :type => :view do
  before(:each) do
    assign(:place_beens, [
      PlaceBeen.create!(
        :latitude => 1.5,
        :longitude => 1.5,
        :user_id => 1,
        :address => "Address",
        :description => "MyText",
        :title => "Title"
      ),
      PlaceBeen.create!(
        :latitude => 1.5,
        :longitude => 1.5,
        :user_id => 1,
        :address => "Address",
        :description => "MyText",
        :title => "Title"
      )
    ])
  end

  it "renders a list of place_beens" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
