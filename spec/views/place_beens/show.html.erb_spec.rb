require 'rails_helper'

RSpec.describe "place_beens/show", :type => :view do
  before(:each) do
    @place_been = assign(:place_been, PlaceBeen.create!(
      :latitude => 1.5,
      :longitude => 1.5,
      :user_id => 1,
      :address => "Address",
      :description => "MyText",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Title/)
  end
end
