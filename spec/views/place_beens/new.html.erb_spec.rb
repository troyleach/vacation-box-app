require 'rails_helper'

RSpec.describe "place_beens/new", :type => :view do
  before(:each) do
    assign(:place_been, PlaceBeen.new(
      :latitude => 1.5,
      :longitude => 1.5,
      :user_id => 1,
      :address => "MyString",
      :description => "MyText",
      :title => "MyString"
    ))
  end

  it "renders new place_been form" do
    render

    assert_select "form[action=?][method=?]", place_beens_path, "post" do

      assert_select "input#place_been_latitude[name=?]", "place_been[latitude]"

      assert_select "input#place_been_longitude[name=?]", "place_been[longitude]"

      assert_select "input#place_been_user_id[name=?]", "place_been[user_id]"

      assert_select "input#place_been_address[name=?]", "place_been[address]"

      assert_select "textarea#place_been_description[name=?]", "place_been[description]"

      assert_select "input#place_been_title[name=?]", "place_been[title]"
    end
  end
end
